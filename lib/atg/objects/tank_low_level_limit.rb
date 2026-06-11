# frozen_string_literal: true

module Atg
  class TankLowLevelLimit < Base
    attr_accessor :number, :low_level_limit

    def initialize(data)
      @number = data[0..1]
      @low_level_limit = ieee754_value(data[2..9])
    end
  end
end
