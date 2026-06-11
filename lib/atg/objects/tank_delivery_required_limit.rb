# frozen_string_literal: true

module Atg
  class TankDeliveryRequiredLimit < Base
    attr_accessor :number, :delivery_required_limit

    def initialize(data)
      @number = data[0..1]
      @delivery_required_limit = ieee754_value(data[2..9])
    end
  end
end
