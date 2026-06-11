# frozen_string_literal: true

module Atg
  class TankMaxVolumeLimit < Base
    attr_accessor :number, :max_volume_limit

    def initialize(data)
      @number = data[0..1]
      @max_volume_limit = ieee754_value(data[2..9])
    end
  end
end
