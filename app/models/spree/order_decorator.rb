Spree::Order.class_eval do
  def total_weight
    flexible_weight_rate_line_items.reduce(0) { |sum, li| sum += li.total_weight }
  end

  private

  def flexible_weight_rate_line_items
    shipping_method_ids = Spree::Calculator::FlexibleWeightRate.pluck(:calculable_id)
    shipping_category_ids = Spree::ShippingMethod
                              .where(id: shipping_method_ids)
                              .joins(:shipping_categories)
                              .pluck('spree_shipping_categories.id')
    line_items.joins(:product).where(spree_products: { shipping_category_id: shipping_category_ids })
  end
end
