# frozen_string_literal: true

module Atg
  class TankDensity < Base
    attr_accessor :number, :density

    def initialize(data)
      @number = data[0..1]
      @density = ieee754_value(data[2..9])
    end
  end
end
