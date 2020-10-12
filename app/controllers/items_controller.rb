class ItemsController < ApplicationController
  before_action :not_login_user, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
       redirect_to root_path
     else
       render :new 
     end
  end
 
private

  def not_login_user
    redirect_to items_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(
      :image, :name, :describe, :category_id, :price, :condition_id, :day_id, :area_id, :shipping_id).merge(user_id: current_user.id)
  end
  
  def set_Item
    @item = Item.find(params[:id])
  end
end
