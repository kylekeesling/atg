# frozen_string_literal: true

module Atg
  class TankLeakTestHistoryRecord < Base
    attr_accessor :tank_number, :results_to_follow, :leak_report_type_number,
      :leak_history_number, :leak_test_type_number, :started_at, :duration_hours,
      :volume, :percentage_full

    ENTRY_LENGTH = 44
    ENTRY_START_POSITION = 16

    def initialize(data)
      @tank_number = data[0..1]
      @results_to_follow = data[2..3].to_i

      @leak_report_type_number = data[4..5]
      @leak_history_number = data[6..7]
      @leak_test_type_number = data[8..9]
      @started_at = parse_timestamp(data[10..19])

      @duration_hours = ieee754_value(data[20..27])
      @volume = ieee754_value(data[28..35])
      @percentage_full = ieee754_value(data[36..43])
    end

    def report_type
      case @leak_report_type_number
      when "00"
        "Last Test Passed"
      when "01"
        "Fullest Test Passed"
      when "02"
        "Fullest Periodic Monthly Test Passed"
      end
    end

    def test_type
      case @leak_test_type_number
      when "00"
        "0.2 gal/hr Test"
      when "01"
        "0.1 gal/hr Test"
      when "02"
        "Gross (3 gal/hr) Test"
      end
    end

    def identifier
      key = [
        @tank_number, @leak_report_type_number, @leak_history_number, @started_at
      ]

      Digest::SHA2.hexdigest(key.join)
    end
  end
end
