require_relative "atg"

IP_ADDRESS = "192.168.7.142"
PORT = "10001"

# telnet = Net::Telnet.new("Host" => IP_ADDRESS, "Port" => PORT, "Prompt" => /\x03/)
# response = telnet.cmd("\x01i20100")
# telnet.close
# print response

Atg::TankInventoryReport.run(ip_address: IP_ADDRESS, port: PORT)
Atg::LiquidSensorStatusReport.run(ip_address: IP_ADDRESS, port: PORT)
Atg::AlarmHistoryReport.run(ip_address: IP_ADDRESS, port: PORT)
Atg::ActiveAlarmReport.run(ip_address: IP_ADDRESS, port: PORT)
Atg::TankLeakTestReport.run(ip_address: IP_ADDRESS, port: PORT)
Atg::CsldMonthlyReport.run(ip_address: IP_ADDRESS, port: PORT)
Atg::CsldMonthlyReport.run(ip_address: IP_ADDRESS, port: PORT, data_field: "1")

Atg::TankReport.run(ip_address: IP_ADDRESS, port: PORT)
Atg::LiquidSensorReport.run(ip_address: IP_ADDRESS, port: PORT)

response = Atg::ActiveAlarmReport.run(ip_address: IP_ADDRESS, port: PORT)
puts response.entries.first.category
puts response.entries.first.type
puts response.entries.first.identifier
