# frozen_string_literal: true

require_relative "atg/version"

require_relative "atg/base"
require_relative "atg/command"
require_relative "atg/response"

require_relative "atg/objects/alarm_attributes"
require_relative "atg/objects/alarm"
require_relative "atg/objects/active_alarm"
require_relative "atg/objects/sensor_status_result"
require_relative "atg/objects/inventory_record"
require_relative "atg/objects/tank_leak_test_result"

require_relative "atg/reports/tank_inventory_report"
require_relative "atg/reports/liquid_status_report"
require_relative "atg/reports/alarm_history_report"
require_relative "atg/reports/active_alarm_report"
require_relative "atg/reports/tank_leak_test_report"

module Atg
  class CommandNotRecognizedError < StandardError; end
end
