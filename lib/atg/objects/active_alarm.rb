# frozen_string_literal: true

require "digest"

module Atg
  class ActiveAlarm < Base
    attr_accessor :alarm_category_code, :category, :sensor_category_code, :sensor_category,
      :alarm_type_number, :type, :tank_sensor_number, :occurred_at

    ENTRY_LENGTH = 18
    ENTRY_START_POSITION = 96

    def initialize(data)
      @alarm_category_code = data[0..1]
      @sensor_category_code = data[2..3]
      @alarm_type_number = data[4..5]
      @tank_sensor_number = data[6..7]
      @occurred_at = parse_timestamp(data[8..17])

      alarm_attributes =
        AlarmAttributes.new(
          category_code: @alarm_category_code,
          type_number: @alarm_type_number,
          sensor_category_code: @sensor_category_code
        )

      @category = alarm_attributes.category
      @type = alarm_attributes.type
      @sensor_category = alarm_attributes.sensor_category
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
