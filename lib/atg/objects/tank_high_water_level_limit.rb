# frozen_string_literal: true

module Atg
  class TankHighWaterLevelLimit < Base
    attr_accessor :number, :high_water_level_limit

    def initialize(data)
      @number = data[0..1]
      @high_water_level_limit = ieee754_value(data[2..9])
    end
  end
end
