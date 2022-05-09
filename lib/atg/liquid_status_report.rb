# frozen_string_literal: true

require "rubyserial"

module Atg
  class LiquidStatusReport < Base
    CODE = "i30100"
    RESPONSE_OBJECT = SensorStatusResult

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
