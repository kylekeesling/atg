# frozen_string_literal: true

module Atg
  class Alarm < Base
    attr_accessor :alarm_category_code, :category, :sensor_category_code, :sensor_category,
      :alarm_type_number, :type, :tank_sensor_number, :alarm_state_code, :state, :occurred_at

    ENTRY_LENGTH = 20
    ENTRY_START_POSITION = 16

    def initialize(data)
      @alarm_category_code = data[0..1]
      @sensor_category_code = data[2..3]
      @alarm_type_number = data[4..5]
      @tank_sensor_number = data[6..7]
      @alarm_state_code = data[8..9]
      @occurred_at = parse_timestamp(data[10..19])

      alarm_attributes =
        AlarmAttributes.new(
          category_code: @alarm_category_code,
          type_number: @alarm_type_number,
          state_code: @alarm_state_code,
          sensor_category_code: @sensor_category_code
        )

      @category = alarm_attributes.category
      @type = alarm_attributes.type
      @state = alarm_attributes.state
      @sensor_category = alarm_attributes.sensor_category
    end
  end
end
