# frozen_string_literal: true

module Atg
  class CsldMonthlyReport < Base
    CODE = "iA56000"
    RESPONSE_OBJECT = CsldResult

    def self.run(port:, timeframe: :current_month)
      flag =
        if timeframe == :previous_month
          1
        else
          0
        end

      command = Command.new(port: port, code: "#{CODE}#{flag}", response_object: RESPONSE_OBJECT)
      command.issue!
    end
  end
end
