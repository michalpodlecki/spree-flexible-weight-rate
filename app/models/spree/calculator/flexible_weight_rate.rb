module Spree
  class Calculator::FlexibleWeightRate < Calculator
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

    def compute(object)
      preferred_initial + additional_cost(object)
    end

    private
    def additional_cost(object)
      shipment_weight = object.total_weight || 1
      additionals = (shipment_weight / preferred_weight).to_i
      additionals -= 1 if (shipment_weight % preferred_weight == 0)
      preferred_cost_per_weight * additionals
    end
  end
end
