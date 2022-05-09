require_relative "atg"

SERIAL_PORT = "/dev/tty.usbserial-240"

Atg::TankInventoryReport.run(port: SERIAL_PORT)
Atg::LiquidStatusReport.run(port: SERIAL_PORT)
Atg::AlarmHistoryReport.run(port: SERIAL_PORT)

response = Atg::ActiveAlarmReport.run(port: SERIAL_PORT)
puts response.entries.first.category
puts response.entries.first.type
puts response.entries.first.identifier
