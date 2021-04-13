class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :check_sold_item, only: [:edit, :update]
  before_action :search_item, only: [:index, :search]
  def index
    @item = Item.order('created_at DESC')
  end

  def show
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = @p.result.includes(:category)
  end
  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :charge_type_id, :prefecture_id,
                                 :shipment_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    redirect_to root_path if current_user.id != @item.user_id
  end

  def check_sold_item
    redirect_to root_path if @item.order != nil
  end

  def search_item
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
