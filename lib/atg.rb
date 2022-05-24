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

require_relative "atg/objects/sensor"
require_relative "atg/objects/liquid_sensor"
require_relative "atg/objects/groundwater_sensor"
require_relative "atg/objects/vapor_sensor"
require_relative "atg/objects/two_wire_sensor"
require_relative "atg/objects/three_wire_sensor"
require_relative "atg/objects/universal_sensor"
require_relative "atg/objects/smart_sensor"
require_relative "atg/objects/sensor_status_result"

require_relative "atg/objects/alarm_attributes"
require_relative "atg/objects/alarm"
require_relative "atg/objects/active_alarm"

require_relative "atg/objects/inventory_record"
require_relative "atg/objects/tank_leak_test_result"
require_relative "atg/objects/csld_result"

require_relative "atg/reports/priority_alarm_history_report"
require_relative "atg/reports/non_priority_alarm_history_report"
require_relative "atg/reports/active_alarm_report"

require_relative "atg/reports/tank_report"
require_relative "atg/reports/tank_inventory_report"
require_relative "atg/reports/tank_leak_test_report"
require_relative "atg/reports/csld_monthly_report"

require_relative "atg/reports/sensors/liquid_sensor_report"
require_relative "atg/reports/sensors/groundwater_sensor_report"
require_relative "atg/reports/sensors/smart_sensor_report"
require_relative "atg/reports/sensors/two_wire_sensor_report"
require_relative "atg/reports/sensors/three_wire_sensor_report"
require_relative "atg/reports/sensors/universal_sensor_report"
require_relative "atg/reports/sensors/vapor_sensor_report"

require_relative "atg/reports/sensor_statuses/liquid_sensor_status_report"
require_relative "atg/reports/sensor_statuses/groundwater_sensor_status_report"
require_relative "atg/reports/sensor_statuses/smart_sensor_status_report"
require_relative "atg/reports/sensor_statuses/two_wire_sensor_status_report"
require_relative "atg/reports/sensor_statuses/three_wire_sensor_status_report"
require_relative "atg/reports/sensor_statuses/universal_sensor_status_report"
require_relative "atg/reports/sensor_statuses/vapor_sensor_status_report"

module Atg
  class CommandNotRecognizedError < StandardError; end

  class InvalidResponseError < StandardError; end

  class ConnectionError < StandardError; end

  SOH = "\x01" # Start of Heading
  EXT = "\x03" # End of Text
end
