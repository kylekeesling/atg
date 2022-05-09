# frozen_string_literal: true

require_relative "atg/version"

require_relative "atg/base"

require_relative "atg/command"
require_relative "atg/response"

require_relative "atg/alarm"
require_relative "atg/active_alarm"
require_relative "atg/sensor_status_result"
require_relative "atg/inventory_record"

require_relative "atg/tank_inventory_report"
require_relative "atg/liquid_status_report"
require_relative "atg/alarm_history_report"
require_relative "atg/active_alarm_report"

module Atg
  class CommandNotRecognizedError < StandardError; end

  # autoload :Base, "atg/base"
  # autoload :Alarm, "atg/alarm"
  # autoload :Response, "atg/response"
end
