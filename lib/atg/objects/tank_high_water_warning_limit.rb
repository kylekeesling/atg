# frozen_string_literal: true

module Atg
  class TankHighWaterWarningLimit < Base
    attr_accessor :number, :high_water_warning_limit

    def initialize(data)
      @number = data[0..1]
      @high_water_warning_limit = ieee754_value(data[2..9])
    end
  end
end
