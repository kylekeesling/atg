# frozen_string_literal: true

require_relative "atg/version"

require_relative "atg/base"
require_relative "atg/command"
require_relative "atg/report"
require_relative "atg/response"

require_relative "atg/adapters/serial_adapter"
require_relative "atg/adapters/telnet_adapter"
require_relative "atg/adapters/test_adapter"

require_relative "atg/objects/tank"
require_relative "atg/objects/liquid_sensor"
require_relative "atg/objects/alarm_attributes"
require_relative "atg/objects/alarm"
require_relative "atg/objects/active_alarm"
require_relative "atg/objects/liquid_sensor_status_result"
require_relative "atg/objects/inventory_record"
require_relative "atg/objects/tank_leak_test_result"
require_relative "atg/objects/csld_result"

require_relative "atg/reports/tank_inventory_report"
require_relative "atg/reports/liquid_sensor_status_report"
require_relative "atg/reports/priority_alarm_history_report"
require_relative "atg/reports/non_priority_alarm_history_report"
require_relative "atg/reports/active_alarm_report"
require_relative "atg/reports/tank_leak_test_report"
require_relative "atg/reports/csld_monthly_report"
require_relative "atg/reports/tank_report"
require_relative "atg/reports/liquid_sensor_report"

module Atg
  class CommandNotRecognizedError < StandardError; end

  class InvalidResponseError < StandardError; end

  class ConnectionError < StandardError; end

  SOH = "\x01" # Start of Heading
  EXT = "\x03" # End of Text
end
