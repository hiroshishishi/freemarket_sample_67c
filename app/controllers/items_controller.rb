class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = @items.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
    # @item.item_images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    
    def get_category_children
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end
  
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  def created
    @item = Item.new(item_params)
    if @item.save
      params[:item_images][:image].each do |image|
        @item.item_images.create(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      @item.item_images.build
      render action: 'new'
    end
  end

  def show
  end

  private

  def item_params
    # params.require(:item).permit(:category_id, :brand, :name, :text, :condition, :price, :trading_status, :completed_at, item_images_attributes: [:image]).merge(user_id: current_user.id)
    params.require(:item).permit(:category_id, :brand, :name, :text, :condition, :price, :trading_status, :completed_at).merge(user_id: current_user.id)
  end
end
