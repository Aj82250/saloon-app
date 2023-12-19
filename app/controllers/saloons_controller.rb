class SaloonsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  def create 
    byebug
  end

  def index
  end
end
