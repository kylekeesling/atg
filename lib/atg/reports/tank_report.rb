# frozen_string_literal: true

module Atg
  class TankReport < Report
    private

    def self.code
      "i60200"
    end

    def self.response_object
      Tank
    end
  end
end
