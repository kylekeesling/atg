# frozen_string_literal: true

module Atg
  class TankThermalCoefficient < Base
    attr_accessor :number, :thermal_coefficient

    def initialize(data)
      @number = data[0..1]
      @thermal_coefficient = ieee754_value(data[2..9])
    end
  end
end
