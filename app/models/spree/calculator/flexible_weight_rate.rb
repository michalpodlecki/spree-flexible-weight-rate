module Spree
  class Calculator::FlexibleWeightRate < ShippingCalculator
    preference :first_package,      :decimal, default: 0.0
    preference :additional_package, :decimal, default: 0.0
    preference :weight,             :decimal, default: 0.0
    preference :currency,           :string,  default: Spree::Config[:currency]

    def self.description
      Spree.t(:shipping_flexible_weight_rate)
    end

    def self.available?(object)
      true
    end

    def compute_package(package)
      preferred_first_package + additional_cost(package)
    end

    private

    def additional_cost(package)
      package_weight = package.total_weight || 1
      additionals = (package_weight / preferred_weight).to_i
      additionals -= 1 if (package_weight % preferred_weight == 0)
      preferred_additional_package * additionals
    end
  end
end
