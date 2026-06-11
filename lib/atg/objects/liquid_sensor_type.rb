# frozen_string_literal: true

module Atg
  class LiquidSensorType < Base
    TYPES = {
      "1" => :tri_state,
      "2" => :normally_closed,
      "3" => :dual_float_hydrostatic,
      "4" => :dual_float_discriminating,
      "5" => :dual_float_high_vapor,
      "6" => :interceptor_sensor,
      "7" => :dw_sump_2_1_sensor
    }.freeze

    attr_accessor :number, :sensor_type

    def initialize(data)
      @number = data[0..1]
      @sensor_type = TYPES[data[2]]
    end
  end
end
