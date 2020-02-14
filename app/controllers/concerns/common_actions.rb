module CommonActions

  extend ActiveSupport::Concern

  def navi_categories
    @categories = Category.where(params[:ancestry])
    @category_children1 = Category.where(ancestry: 1)
    @category_children200 = Category.where(ancestry: 200)
    @category_children345 = Category.where(ancestry: 345)
    @category_children477 = Category.where(ancestry: 477)
    @category_children618 = Category.where(ancestry: 618)
    @category_children677 = Category.where(ancestry: 677)
    @category_children790 = Category.where(ancestry: 790)
    @category_children890 = Category.where(ancestry: 890)
    @category_children975 = Category.where(ancestry: 975)
    @category_children1084 = Category.where(ancestry: 1084)
    @category_children1135 = Category.where(ancestry: 1135)
    @category_children1194 = Category.where(ancestry: 1194)
    @category_children1257 = Category.where(ancestry: 1257)
  end


end