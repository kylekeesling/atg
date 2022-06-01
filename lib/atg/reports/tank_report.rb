# frozen_string_literal: true

module Atg
  class TankReport < Report
    def command_code
      "i60200"
    end

    def result_object
      Tank
    end

    def result_length
      22
    end
  end
end
