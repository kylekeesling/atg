# frozen_string_literal: true

module Atg
  class CsldResult < Base
    attr_accessor :tank_number, :result_code

    def initialize(data)
      @tank_number = data[0..1]
      @result_code = data[2..3]
    end

    def result
      case @result_code
      when "01"
        "PASS"
      when "02"
        "FAIL"
      when "03"
        "NO RESULTS AVAILABLE"
      when "04"
        "INVALID"
      when "08"
        "INCR"
      when "09"
        "WARN"
      end
    end
  end
end
