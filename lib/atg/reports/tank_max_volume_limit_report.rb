# frozen_string_literal: true

module Atg
  class TankMaxVolumeLimitReport < Report
    def command_code
      "i62800"
    end

    def result_object
      TankMaxVolumeLimit
    end

    def result_length
      10
    end
  end
end
