# frozen_string_literal: true

module Atg
  class TankLeakAlarmLimit < Base
    attr_accessor :number, :leak_alarm_limit

    def initialize(data)
      @number = data[0..1]
      @leak_alarm_limit = ieee754_value(data[2..9])
    end
  end
end
