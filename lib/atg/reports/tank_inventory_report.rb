# frozen_string_literal: true

module Atg
  class TankInventoryReport < Base
    CODE = "i20100"
    RESPONSE_OBJECT = InventoryRecord

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
