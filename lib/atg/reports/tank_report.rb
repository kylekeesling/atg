# frozen_string_literal: true

module Atg
  class TankReport < Base
    CODE = "i60200"
    RESPONSE_OBJECT = Tank

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
