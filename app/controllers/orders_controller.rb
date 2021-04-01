class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
    if current_user == @item.user || @item.user_buy_address.present?
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
      if @order.valid?
         pay_item
         @order.save
         redirect_to root_path
      else
        render :index
      end
  end

  private

  def order_params
    params.require(:order).permit(:address_line, :delivery_area_id, :city, :block_number, :city_bill, :phone_number, :user_buy_address, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],
      currency: 'jpy'  
    )
  end

  
end

