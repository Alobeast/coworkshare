class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @room_attributes = Room.attribute_names - ["created_at", "updated_at", "id"]
  end
end
