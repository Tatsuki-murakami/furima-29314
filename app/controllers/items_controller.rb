class ItemsController < ApplicationController
  before_action :not_login_user, only: [:new, :create, ]
  before_action :set_Item, only: [ :edit, :update, :show, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items=Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
