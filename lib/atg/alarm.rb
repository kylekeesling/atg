# frozen_string_literal: true

require_relative "alarm_codes"

module Atg
  class Alarm < Base
    attr_accessor :alarm_category_code, :sensor_category_code, :alarm_type_number,
      :tank_sensor_number, :alarm_state_code, :occurred_at

    ENTRY_LENGTH = 20
    ENTRY_START_POSITION = 16

    def initialize(data)
      @alarm_category_code = data[0..1]
      @sensor_category_code = data[2..3]
      @alarm_type_number = data[4..5]
      @tank_sensor_number = data[6..7]
      @alarm_state_code = data[8..9]
      @occurred_at = parse_timestamp(data[10..19])
    end
  end
end
