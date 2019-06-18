class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @room_attributes = Room.attribute_names - ["created_at", "updated_at", "id"]
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create!(room_params)
    redirect_to rooms_path
  end


  private
    def room_params
      params.require(:room).permit(:name, :size, :price, :picture)
    end
end
