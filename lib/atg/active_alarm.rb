# frozen_string_literal: true

require_relative "alarm_codes"
require "digest"

module Atg
  class ActiveAlarm < Base
    include AlarmCodes

    attr_accessor :alarm_category_code, :sensor_category_code, :alarm_type_number,
      :tank_sensor_number, :occurred_at

    ENTRY_LENGTH = 20
    ENTRY_START_POSITION = 96

    def initialize(data)
      @alarm_category_code = data[0..1]
      @sensor_category_code = data[2..3]
      @alarm_type_number = data[4..5]
      @tank_sensor_number = data[6..7]
      @occurred_at = parse_timestamp(data[8..17])
    end

    def identifier
      key = [
        @alarm_category_code, @sensor_category_code, @alarm_type_number,
        @tank_sensor_number, @occurred_at
      ]

      Digest::SHA2.hexdigest(key.join)
    end
  end
end
