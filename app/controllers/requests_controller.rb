class RequestsController < ApplicationController
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
    @request = Request.find(params[:id])
    if @request.update(status: 'confirmed')
      RequestMailer.reconfirmation(@request).deliver_later(wait: 30.seconds)
      CheckReconfirmJob.set(wait: 3.minutes).perform_later(@request.id)
      redirect_to pages_thanks_path
    end
  end

  def reconfirm
    @request = Request.find(params[:id])
    @request.update(reconfirmed: true)
    RequestMailer.reconfirmation(@request).deliver_later(wait: 30.seconds)
    CheckReconfirmJob.set(wait: 3.minutes).perform_later(@request.id)
    redirect_to pages_thanks_path
  end

  private

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email,
                                    :phone_number, :about, :status, :reconfirmed)
  end
end
