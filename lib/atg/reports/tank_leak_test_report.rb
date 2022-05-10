# frozen_string_literal: true

module Atg
  class TankLeakTestReport < Base
    CODE = "i20700"
    RESPONSE_OBJECT = TankLeakTestResult

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end