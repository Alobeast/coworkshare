class RequestsController < ApplicationController
  before_action :set_request, only: [:confirm, :reconfirm, :thanks]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to thanks_request_path(@request)
    else
      render :new
    end
  end

  def confirm
    @request.update(status: 'confirmed')
    reconfirmation
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
    @requests = Request.where(nil)
    @requests = @requests.status(params[:status]) if params[:status].present?
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
                                    :phone_number, :about, :status, :reconfirmed)
  end
end
