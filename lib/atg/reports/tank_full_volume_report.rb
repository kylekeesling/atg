# frozen_string_literal: true

module Atg
  class TankFullVolumeReport < Report
    def command_code
      "i60400"
    end

    def result_object
      TankFullVolume
    end

    def result_length
      10
    end
  end
end
