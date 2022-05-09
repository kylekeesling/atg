# frozen_string_literal: true

module Atg
  class InventoryRecord < Base
    attr_accessor :tank_number, :product_code, :tank_status_bits, :number_of_fields,
      :volume, :tc_volume, :ullage, :height, :water, :temperature, :water_volume

    ENTRY_LENGTH = 65
    ENTRY_START_POSITION = 16

    def initialize(data)
      @tank_number = data[0..1]
      @product_code = data[2]
      @tank_status_bits = data[3..6]
      @number_of_fields = data[7..8]

      @volume = ieee754_value(data[9..16])
      @tc_volume = ieee754_value(data[17..24])
      @ullage = ieee754_value(data[25..32])
      @height = ieee754_value(data[33..40])
      @water = ieee754_value(data[41..48])
      @temperature = ieee754_value(data[49..56])
      @water_volume = ieee754_value(data[57..64])
    end
  end
end
