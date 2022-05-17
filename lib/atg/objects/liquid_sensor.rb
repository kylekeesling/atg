# frozen_string_literal: true

require "digest"

module Atg
  class LiquidSensor < Base
    attr_accessor :number, :location_label

    ENTRY_LENGTH = 22
    ENTRY_START_POSITION = 16

    def initialize(data)
      @number = data[0..1]
      @location_label = data[2..21].rstrip
    end
  end
end
