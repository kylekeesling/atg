# frozen_string_literal: true

module Atg
  class LiquidSensorCategory < Base
    CATEGORIES = {
      "1" => :other,
      "2" => :annular,
      "3" => :dispenser_pan,
      "4" => :monitoring_well,
      "5" => :stp_sump,
      "6" => :piping_sump
    }.freeze

    attr_accessor :number, :category

    def initialize(data)
      @number = data[0..1]
      @category = CATEGORIES[data[2]]
    end
  end
end
