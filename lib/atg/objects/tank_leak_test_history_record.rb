# frozen_string_literal: true

module Atg
  class TankLeakTestHistoryRecord < Base
    attr_accessor :tank_number, :report_type_code, :leak_history_number, :test_type_code,
      :started_at, :duration_hours, :volume, :percentage_full

    ENTRY_LENGTH = 44
    ENTRY_START_POSITION = 16

    def initialize(data)
      @tank_number = data[0..1]

      @report_type_code = data[2..3]
      @leak_history_number = data[4..5]
      @test_type_code = data[6..7]

      @started_at = parse_timestamp(data[8..17])

      @duration_hours = ieee754_value(data[18..25])
      @volume = ieee754_value(data[26..33])
      @percentage_full = ieee754_value(data[34..41])
    end

    def report_type
      case @report_type_code
      when "00"
        "Last Test Passed"
      when "01"
        "Fullest Test Passed"
      when "02"
        "Fullest Periodic Monthly Test Passed"
      end
    end

    def test_type
      case @test_type_code
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
        @tank_number, @report_type_code, @started_at
      ]

      Digest::SHA2.hexdigest(key.join)
    end
  end
end
