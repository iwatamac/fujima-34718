class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    #params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :responsibility_id, :delivery_area_id, :delivery_days_id)merge(user_id: current_user.id)
  end
end
