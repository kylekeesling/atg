require_relative "../lib/atg"

IP_ADDRESS = "192.168.7.142"
PORT = "10001"

# telnet = Net::Telnet.new("Host" => IP_ADDRESS, "Port" => PORT, "Prompt" => /\x03/)
# response = telnet.cmd("\x01i20700")
# telnet.close
# print response

adapter = Atg::TelnetAdapter.new(ip_address: IP_ADDRESS, port: PORT)

# Atg::TankInventoryReport.run(adapter: adapter)
# Atg::LiquidSensorStatusReport.run(adapter: adapter)
# Atg::AlarmHistoryReport.run(adapter: adapter)
# Atg::ActiveAlarmReport.run(adapter: adapter)
# Atg::TankLeakTestReport.run(adapter: adapter)
# Atg::CsldMonthlyReport.run(adapter: adapter)
# Atg::CsldMonthlyReport.run(adapter: adapter, data_field: "1")

# Atg::TankReport.run(adapter: adapter)
# Atg::LiquidSensorReport.run(adapter: adapter)

response = Atg::TankLeakTestReport.run(adapter: adapter)
puts response.entries.first.inspect
