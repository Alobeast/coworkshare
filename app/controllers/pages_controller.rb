class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :thanks]

  def home
  end

  def thanks
  end
end
