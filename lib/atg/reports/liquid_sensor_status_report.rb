# frozen_string_literal: true

module Atg
  class LiquidSensorStatusReport < Base
    CODE = "i30100"
    RESPONSE_OBJECT = LiquidSensorStatusResult

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
