class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.create!(service_params)
    redirect_to services_path
  end


  private
    def service_params
      params.require(:service).permit(:name, :quantity_day, :price_unit_day)
    end
end
