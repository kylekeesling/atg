# frozen_string_literal: true

module Atg
  class TankDiameter < Base
    attr_accessor :number, :diameter

    def initialize(data)
      @number = data[0..1]
      @diameter = ieee754_value(data[2..9])
    end
  end
end
