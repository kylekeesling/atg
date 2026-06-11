# frozen_string_literal: true

module Atg
  class TankFullVolume < Base
    attr_accessor :number, :full_volume

    def initialize(data)
      @number = data[0..1]
      @full_volume = ieee754_value(data[2..9])
    end
  end
end
