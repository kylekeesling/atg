require_relative "atg"

SERIAL_PORT = "/dev/tty.usbserial-240"

# serial_port = Serial.new(SERIAL_PORT)
# request = serial_port.write("\x01i11300")
# puts serial_port.gets("\x03")

# Atg::TankInventoryReport.run(serial_port: SERIAL_PORT)
# Atg::LiquidSensorStatusReport.run(serial_port: SERIAL_PORT)
# Atg::AlarmHistoryReport.run(serial_port: SERIAL_PORT)
Atg::ActiveAlarmReport.run(serial_port: SERIAL_PORT)
# Atg::TankLeakTestReport.run(serial_port: SERIAL_PORT)
# Atg::CsldMonthlyReport.run(serial_port: SERIAL_PORT)
# Atg::CsldMonthlyReport.run(serial_port: SERIAL_PORT, data_field: "1")

# Atg::TankReport.run(serial_port: SERIAL_PORT)
# Atg::LiquidSensorReport.run(serial_port: SERIAL_PORT)

# response = Atg::ActiveAlarmReport.run(serial_port: SERIAL_PORT)
# puts response.entries.first.category
# puts response.entries.first.type
# puts response.entries.first.identifier
