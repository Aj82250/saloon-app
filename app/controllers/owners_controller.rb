class OwnersController < ApplicationController 
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_owner, only: [:show, :destroy, :update]
  def index
    render json: Owner.all, status: :ok
  end

  def create
    owner = Owner.new(owner_params)
    if params[:password] == params[:confirm_password] 
      if owner.save
        render json: owner, status: :ok
      else
        render json: { message: "Not created" }
      end
    else
      render json: { error: "password and confirm_password doesn't match" }
    end
  end

  def update
    if @owner.update(owner_params.merge(password:@owner.password_digest))
      render json: @owner, status: :ok
    else
      render json: { message: "Not updated" }
    end
  end

  def show
    render json: @owner, status: :ok
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
    params.permit(:name,:email, :phone_number, :password, :shop_id)
  end

  def find_owner
    @owner = Owner.find_by(id: params[:id])
    unless @owner.present?
      render json: { message: "Record not found " }
    end
  end
end
