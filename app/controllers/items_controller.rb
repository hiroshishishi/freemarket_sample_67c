class ItemsController < ApplicationController
  before_action :navi_parents, only: [:index]
  before_action :set_categories, only: [:index, :new, :create, :edit, :update]
  def index
    @items = Item.all
    @items = @items.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.new
    
    def get_category_children
      @category_children = Category.find(params[:parent_name]).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  def create
    @item = Item.create(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
    end
  end

  def show
  end

  private

  def set_categories
    @categories = Category.where(ancestry: nil)
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def item_params
    params.permit(:category, :brand, :title, :text, :condition_id, :prefecture_id, :fee_id, :deliveryday_id, :price, images_attributes: [:src]).merge(seller_id: current_user.id)
  end
end
