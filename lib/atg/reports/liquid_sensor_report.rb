# frozen_string_literal: true

module Atg
  class LiquidSensorReport < Base
    CODE = "i70200"
    RESPONSE_OBJECT = LiquidSensor

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
