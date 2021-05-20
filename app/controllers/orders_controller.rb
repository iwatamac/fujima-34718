class OrdersController < ApplicationController

  def index
  end

  def create
    @order = Order.create
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: @order.id)
  end
end
