class ItemsController < ApplicationController
  before_action :navi_parents, only: [:index]
  before_action :set_categories, only: [:index, :new, :create, :edit, :update]
  before_action :set_item, only: [:show, :paycheck, :pay]

  require 'payjp'

  def index
    @items = Item.all
    @items = @items.includes(:user).order("created_at DESC")
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

  def show
    @seller_id = User.find(@item.seller_id)
    @category = @item.category
  end 

  def paycheck
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:payjp_secret_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials[:payjp][:payjp_secret_key]
    Payjp::Charge.create(
    amount:  @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer:  @card.customer_id, #顧客ID
    currency:  'jpy', #日本円
  )
  @item_buyer = Item.find(params[:id])
  @item_buyer.update( buyer_id: current_user.id)
  redirect_to root_path #完了画面に移動
  end

  private

  def set_categories
    @categories = Category.where(ancestry: nil)
    @category_parent_array = Category.pluck(:name)
  end

  def item_params
    params.require(:item).permit(:category_id, :brand, :title, :text, :condition_id, :prefecture_id, :fee_id, :deliveryday_id, :price, images_attributes: [:src]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
end
