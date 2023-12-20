class ShopsController < ApplicationController
  include JsonWebToken
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_shop, only: [:show, :update, :destroy]

  def create
    shop = Shop.new(shop_params)
    if shop.save
      token = jwt_encode(account_id: shop.id)
      render json: {data: ShopSerializer.new(shop), token: token}
    else
      render json: {messsage: "not successfullty"}
    end
  end

  def show
    render json: {data: ShopSerializer.new(shop)}
  end

  def update 
    if @shop.update(shop_params)
      render json: {data: ShopSerializer.new(shop)}
    else
      render json: {messsage: "not successfullty"}
    end
  end

  def destroy
    if @shop.present?
      render json: {data: ShopSerializer.new(shop)}
    else
      render json: {messsage: "not successfullty"}
    end
  end


  private

  def find_shop
    @shop = Shop.find_by(id: @current_user.id)
    unless @shop.present?
      render json: {message: "Shop not found"}
  end
  def shop_params
    params.require(:data).permit(:name, :shop_start_time, :shop_end_time, :full_phone_number)
  end
end
