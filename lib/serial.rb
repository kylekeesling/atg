require_relative "atg"

SERIAL_PORT = "/dev/tty.usbserial-240"

# Atg::TankInventoryReport.run(port: SERIAL_PORT)
# Atg::LiquidStatusReport.run(port: SERIAL_PORT)
# Atg::AlarmHistoryReport.run(port: SERIAL_PORT)
# Atg::ActiveAlarmReport.run(port: SERIAL_PORT)
Atg::TankLeakTestReport.run(port: SERIAL_PORT)

serial_port = Serial.new(SERIAL_PORT)
request = serial_port.write("\x01I21200")
puts serial_port.gets("\x03")

# response = Atg::ActiveAlarmReport.run(port: SERIAL_PORT)
# puts response.entries.first.category
# puts response.entries.first.type
# puts response.entries.first.identifier
