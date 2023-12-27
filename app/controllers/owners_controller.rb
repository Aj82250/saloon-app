class OwnersController < ApplicationController 
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_owner, only: [:show, :destroy, :update]
  before_action :check_password, only: [:create, :update]
  def index
     render json: {data: Owner.all }, status: :ok, each_serializer: OwnerSerializer
  end

  def create
    owner = Owner.new(owner_params)
    if owner.save
      render json: { data: OwnerSerializer.new(owner) } , status: :created
    else
      render json: owner.errors
    end
  end

  def update
    if @owner.update(owner_params)
      render json: { data: OwnerSerializer.new(@owner) }, status: :ok
    else
      render json: { message: "Not updated" }
    end
  end

  def show
    render json: { data: OwnerSerializer.new(@owner) }, status: :ok
  end

  def destroy
    if @owner.destroy
      render json: { message: "Record delete successfully" }, status: :ok
    else
      render json: { message: "Not delted" }
    end
  end


  private

  def owner_params
    params.require(:data).permit(:name,:email, :phone_number, :password, :shop_id, 
      media_attributes: [:name, :url] , address_attributes: [:country, :latitude, :longitude, :address, :address_type] )
  end

  def find_owner
    @owner = Owner.find_by(id: params[:id])
    unless @owner.present?
      render json: { message: "Record not found " }
    end
  end

  def check_password
    return if params[:data][:password] == params[:data][:confirm_password] 
      
    render json: { error: "password and confirm_password doesn't match" }
  end
end
