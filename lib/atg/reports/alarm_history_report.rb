# frozen_string_literal: true

module Atg
  class AlarmHistoryReport < Base
    CODE = "i11100"
    RESPONSE_OBJECT = Alarm

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
