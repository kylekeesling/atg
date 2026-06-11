# frozen_string_literal: true

module Atg
  class TankOverfillLimit < Base
    attr_accessor :number, :overfill_limit

    def initialize(data)
      @number = data[0..1]
      @overfill_limit = ieee754_value(data[2..9])
    end
  end
end
