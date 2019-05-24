class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.save
  end

  private

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email,
                                    :phone_number, :about)
  end
end
