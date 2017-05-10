Spree::Stock::Package.class_eval do
  def total_weight
    order.total_weight
  end
end
