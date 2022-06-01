# frozen_string_literal: true

module Atg
  class TankLeakTestResult < Base
    attr_accessor :tank_number, :results_to_follow, :result_type_code,
      :manifold_status_code, :started_at, :result_code, :test_rate,
      :duration_hours, :volume

    def initialize(data)
      @tank_number = data[0..1]
      @results_to_follow = data[2..3].to_i(16) # is a hex value

      @result_type_code = data[4..5]
      @manifold_status_code = data[6..7]

      @started_at = parse_timestamp(data[8..17])

      @result_code = data[18..19]

      @test_rate = ieee754_value(data[20..26])
      @duration_hours = ieee754_value(data[27..35])
      @volume = ieee754_value(data[36..43])
    end

    def result_type
      case @result_type_code
      when "00"
        "0.2 gal/hr Test"
      when "01"
        "0.1 gal/hr Test"
      when "02"
        "Gross (3 gal/hr) Test"
      end
    end

    def manifold_status
      case @manifold_status_code
      when "00"
        "Tank Not Manifolded During Leak Test"
      when "01"
        "Tank Manifolded During Leak Test"
      end
    end

    def result
      case @result_code
      when "00"
        "Test Invalid"
      when "01"
        "Test Passed"
      when "02"
        "Test Failed"
      end
    end

    def identifier
      key = [
        @tank_number, @result_type_code, @started_at
      ]

      Digest::SHA2.hexdigest(key.join)
    end
  end
end
