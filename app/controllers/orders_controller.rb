class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_item, only: [:index, :create]
  before_action :move_to_index
  before_action :not_login_user, only: [:index, :new, :create]

  def index
    @order = OrderDelivery.new()
  end


  def create
    @order = OrderDelivery.new(order_params)

    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def order_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number,:order_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
    
  def not_login_user
    redirect_to items_path unless user_signed_in?
  end

  def move_to_index
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end