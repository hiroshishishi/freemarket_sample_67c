class ItemsController < ApplicationController
  before_action :navi_parents, only: [:index]
  before_action :set_categories, only: [:index, :new, :create, :edit, :update]
  before_action :set_item, only: [:show]
  def index
    @items = Item.all.limit(5)
    @item = @items.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build
    
    def get_category_children
      @category_children = Category.find(params[:parent_name]).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
      flash[:success] = '商品を削除しました'
    else
      redirect_to item_path
      flash[:danger] = '商品削除に失敗しました'
    end
  end

  def edit
    @item = Item.find(params[:id])
    @selected_grandchild_category = @item.category
    @category_grandchild_array = @selected_grandchild_category.siblings.pluck(:id, :name)

    @selected_child_category = @selected_grandchild_category.parent
    @category_child_array = @selected_child_category.siblings.pluck(:id, :name)
    
    @selected_parent_category = @selected_grandchild_category.root
    @category_parent_array = @selected_parent_category.siblings.pluck(:id, :name)

    redirect_to root_path unless @item.seller_id == current_user.id

    def get_category_children
      @category_children = Category.find(params[:parent_name]).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  def update
    @item = Item.find(params[:id])
    # binding.pry
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to action: 'edit'
    end
  end

  def show
    @seller_id = User.find(@item.seller_id)
    @category = @item.category
  end

  private

  def set_categories
    @categories = Category.where(ancestry: nil)
    @category_parent_array = Category.pluck(:name)
  end

  def item_params
    params.require(:item).permit(:category_id, :brand, :title, :text, :condition_id, :prefecture_id, :fee_id, :deliveryday_id, :price, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end