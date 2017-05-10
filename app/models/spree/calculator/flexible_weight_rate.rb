module Spree
  class Calculator::FlexibleWeightRate < ShippingCalculator
    preference :initial,      :decimal, :default => 0.0
    preference :cost_per_weight, :decimal, :default => 0.0
    preference :weight, :decimal, :default => 0.0
    preference :currency, :string, :default => Spree::Config[:currency]

    def self.description
      "Flexible Weight Rate"
    end

    def self.available?(object)
      true
    end

    def compute_package(package)
      preferred_initial + additional_cost(package)
    end

    private
    def additional_cost(package)
      package_weight = package.total_weight || 1
      additionals = (package_weight / preferred_weight).to_i
      additionals -= 1 if (package_weight % preferred_weight == 0)
      preferred_cost_per_weight * additionals
    end
  end
end
