require_relative "atg"

SERIAL_PORT = "/dev/tty.usbserial-240"

serial_port = Serial.new(SERIAL_PORT)
request = serial_port.write("\x01i70200")
puts serial_port.gets("\x03")

# Atg::TankInventoryReport.run(port: SERIAL_PORT)
Atg::LiquidSensorStatusReport.run(port: SERIAL_PORT)
# Atg::AlarmHistoryReport.run(port: SERIAL_PORT)
# Atg::ActiveAlarmReport.run(port: SERIAL_PORT)
# Atg::TankLeakTestReport.run(port: SERIAL_PORT)
# Atg::CsldMonthlyReport.run(port: SERIAL_PORT)

# Atg::TankReport.run(port: SERIAL_PORT)
Atg::LiquidSensorReport.run(port: SERIAL_PORT)

# response = Atg::ActiveAlarmReport.run(port: SERIAL_PORT)
# puts response.entries.first.category
# puts response.entries.first.type
# puts response.entries.first.identifier
