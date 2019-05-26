class RequestsController < ApplicationController
  before_action :set_request, only: [:confirm, :reconfirm]

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to pages_thanks_path
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

  private

  def reconfirmation
    RequestMailer.reconfirmation(@request).deliver_later(wait: 30.seconds)
    CheckReconfirmJob.set(wait: 3.minutes).perform_later(@request.id)
    redirect_to pages_thanks_path
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email,
                                    :phone_number, :about, :status, :reconfirmed)
  end
end
