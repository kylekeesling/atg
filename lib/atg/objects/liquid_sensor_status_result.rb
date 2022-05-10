# frozen_string_literal: true

module Atg
  class LiquidSensorStatusResult < Base
    attr_accessor :sensor_number, :sensor_status_value

    ENTRY_LENGTH = 6
    ENTRY_START_POSITION = 16

    def initialize(data)
      @sensor_number = data[0..1]
      @sensor_status_value = data[2..3]
    end

    def status
      case @sensor_status_value
      when "0000"
        "Sensor Normal"
      when "0001"
        "Sensor Setup Data Warning"
      when "0002"
        "Sensor Fuel Alarm"
      when "0003"
        "Sensor Out Alarm"
      when "0004"
        "Sensor Short Alarm"
      when "0005"
        "Sensor Water Alarm"
      when "0006"
        "Sensor Water Out Alarm"
      when "0007"
        "Sensor High Liquid Alarm"
      when "0008"
        "Sensor Low Liquid Alarm"
      when "0009"
        "Sensor Liquid Warning"
      end
    end
  end
end
