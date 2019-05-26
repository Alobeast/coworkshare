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
      redirect_to pages_thanks_path
      reconfirm
    end
  end

  def reconfirm
    sleep(1.minute)
    @request.update(status: 'expired')
    RequestMailer.reconfirmation(@request).deliver_now
  end

  private

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email,
                                    :phone_number, :about, :status)
  end
end
