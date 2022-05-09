# frozen_string_literal: true

require "rubyserial"

module Atg
  class ActiveAlarmReport < Base
    CODE = "i11300"
    RESPONSE_OBJECT = ActiveAlarm

    def self.run(port:)
      command = Command.new(port: port, code: CODE, response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
