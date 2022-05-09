# frozen_string_literal: true

module Atg
  class TankLeakTestResult < Base
    # attr_accessor :sensor_number, :sensor_status_value

    ENTRY_LENGTH = 44
    ENTRY_START_POSITION = 16

    def initialize(data)
      @tank_number = data[0..1]
      @results_to_follow = data[2..3].to_i

      @leak_report_type_number = data[4..5]
      @leak_history_number = data[6..7]
      @leak_type_test = data[8..9]
      @started_at = parse_timestamp(data[10..19])

      @duration_hours = ieee754_value(data[20..27])
      @volume = ieee754_value(data[28..35])
      @percentage_full = ieee754_value(data[36..43])
    end

    def report_type
      case @leak_report_type_number
      when "00"
        "0.2 gal/hr Test"
      when "01"
        "0.1 gal/hr Test"
      when "02"
        "Gross (3 gal/hr) Test"
      end
    end
  end
end
