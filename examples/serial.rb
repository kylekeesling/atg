require_relative "../lib/atg"

SERIAL_PORT = "/dev/tty.usbserial-240"

# serial_port = Serial.new(SERIAL_PORT)
# request = serial_port.write("\x01i11300")
# puts serial_port.gets("\x03")

adapter = Atg::SerialAdapter.new(port: SERIAL_PORT)

Atg::TankInventoryReport.run(adapter: adapter)
Atg::LiquidSensorStatusReport.run(adapter: adapter)
Atg::AlarmHistoryReport.run(adapter: adapter)
Atg::ActiveAlarmReport.run(adapter: adapter)
Atg::TankLeakTestReport.run(adapter: adapter)
Atg::CsldMonthlyReport.run(adapter: adapter)
Atg::CsldMonthlyReport.run(adapter: adapter, data_field: "1")

Atg::TankReport.run(adapter: adapter)
Atg::LiquidSensorReport.run(adapter: adapter)

# response = Atg::ActiveAlarmReport.run(serial_port: SERIAL_PORT)
# puts response.entries.first.category
# puts response.entries.first.type
# puts response.entries.first.identifier
