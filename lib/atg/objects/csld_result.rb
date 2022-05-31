# frozen_string_literal: true

module Atg
  class CsldResult < Base
    attr_accessor :tank_number, :state_changes, :changed_at, :state_change_code

    def initialize(data)
      @tank_number = data[0..1]
      @state_changes = data[2..3].to_i
      @changed_at = parse_timestamp(data[4..13])

      @state_change_code = data[14..15]
    end

    def state
      case @state_change_code
      when "01"
        "RESULT: PASS"
      when "02"
        "RESULT: FAIL"
      when "03"
        "RESULT: NO RESULTS AVAILABLE"
      when "04"
        "RESULT: INVALID"
      when "08"
        "RESULT: INCR"
      when "98"
        "RESULT: NO IDLE DATA"
      when "99"
        "RESULT: ACTIVE"
      end
    end
  end
end
