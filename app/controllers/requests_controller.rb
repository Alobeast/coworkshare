class RequestsController < ApplicationController
  before_action :set_request, only: [:confirm, :reconfirm, :thanks]

   def new
    @request = Request.new
    @requests = Request.all
    @rooms = Room.all

    @request_array = @requests.map { |request|
        {
          title: "#{request.room.name} room",
          start: request.start_date.strftime("%Y-%m-%d"),
          end: (request.end_date + 1.days).strftime("%Y-%m-%d")
        }
    }.to_json
  end

  def create
    @request = Request.new(request_params.merge(user: current_user))
    if @request.save!
      redirect_to thanks_request_path(@request)
    else
      render :new
    end
  end

  def confirm
    if @request.status == "unconfirmed"
      @request.update(status: 'confirmed')
      reconfirmation
    else
      redirect_to root_path
    end
  end

  def reconfirm
    @request.update(reconfirmed: true)
    reconfirmation
  end

  def thanks
    if @request.status == "confirmed"
      @waiting_list = Request.order("created_at").confirmed.to_a
      @position = @waiting_list.index { |confirmed| confirmed.id == @request.id } + 1
    end
  end

  def index
    if current_user.admin?
      @requests = Request.all
      @requests = @requests.status(params[:status]) if params[:status].present?

      respond_to do |format|
        format.xlsx { response.headers['Content-Disposition'] = "attachment; filename=requests.xlsx"}
        format.html { render :index }
      end
    else
      redirect_to root_path
    end
  end

  private

  def reconfirmation
    RequestMailer.reconfirmation(@request).deliver_later(wait: 3.months)
    CheckReconfirmJob.set(wait: 3.months + 7.days).perform_later(@request.id)
    redirect_to thanks_request_path(@request)
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email,
                                    :phone_number, :about, :status, :reconfirmed, :user, :room_id, :start_date, :end_date)
  end
end
