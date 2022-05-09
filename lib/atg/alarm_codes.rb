# frozen_string_literal: true

module Atg
  module AlarmCodes
    attr_accessor :alarm_category_code, :sensor_category_code, :alarm_type_number,
      :tank_sensor_number, :occurred_at

    ENTRY_LENGTH = 20
    ENTRY_START_POSITION = 96

    def initialize(data)
      @alarm_category_code = data[0..1]
      @sensor_category_code = data[2..3]
      @alarm_type_number = data[4..5]
      @tank_sensor_number = data[6..7]
      @occurred_at = parse_timestamp(data[8..17])
    end

    def identifier
      key = [
        @alarm_category_code, @sensor_category_code, @alarm_type_number,
        @tank_sensor_number, @occurred_at
      ]

      Digest::SHA2.hexdigest(key.join)
    end

    def warning?
      type.include?("Warning")
    end

    def alarm?
      !warning?
    end

    def category
      case @alarm_category_code
      when "00"
        "All Functions Normal"
      when "01"
        "System Alarm"
      when "02"
        "Tank Alarm"
      when "03"
        "Liquid Sensor Alarm"
      when "04"
        "Vapor Sensor Alarm"
      when "05"
        "Input Alarm"
      when "06"
        "Volumetric Line Leak Alarm"
      when "07"
        "Groundwater Sensor Alarm "
      when "08"
        "Type A Sensor Alarm"
      when "12"
        "Type B Sensor Alarm"
      when "13"
        "Universal Sensor Alarm"
      when "14"
        "Auto-Dial Fax Alarm"
      when "18"
        "Mechanical Dispenser Interface Alarm"
      when "19"
        "Electronic Dispenser Interface Alarm"
      when "20"
        "Product Alarm"
      when "21"
        "Pressure Line Leak Alarm"
      when "26"
        "Wireless PLLD Alarm"
      when "28"
        "Smart Sensor Alarm"
      when "29"
        "Modbus Alarm"
      when "30"
        "ISD Site Alarm"
      when "31"
        "ISD Hose Alarm"
      when "32"
        "ISD Vapor Flow Meter Alarm"
      when "33"
        "PMC Alarm"
      when "34"
        "Pump Relay Monitor Alarm"
      when "35"
        "VMCI Dispenser Interface Alarm"
      when "36"
        "VMC Alarm"
      when "99"
        "Externally Detected Alarm (not reported by Console)"
      end
    end

    def type
      if @alarm_category_code == "01"
        system_alarm_type
      elsif @alarm_category_code == "02"
        tank_alarm_type
      elsif ["03", "04", "07", "08", "12", "13"].include?(@alarm_category_code)
        sensor_alarm_type
      elsif @alarm_category_code == "05"
        input_alarm_type
      elsif @alarm_category_code == "06"
        volumetric_link_leak_alarm_type
      elsif @alarm_category_code == "14"
        auto_dial_alarm_type
      elsif ["18", "19"].include?(@alarm_category_code)
        mechanical_dispenser_interface_alarm_type
      elsif @alarm_category_code == "20"
        product_alarm_type
      elsif @alarm_category_code == "21"
        pressure_lld_alarm_type
      elsif @alarm_category_code == "26"
        wireless_plld_alarm_type
      elsif @alarm_category_code == "28"
        smart_sensor_alarm_type
      elsif @alarm_category_code == "29"
        modbus_alarm_type
      elsif @alarm_category_code == "30"
        isd_site_alarm_type
      elsif @alarm_category_code == "31"
        isd_hose_alarm_type
      elsif @alarm_category_code == "32"
        isd_vapor_flow_meter_alarm_type
      elsif @alarm_category_code == "33"
        pmc_alarm_type
      elsif @alarm_category_code == "34"
        pump_relay_monitor_alarm_type
      elsif @alarm_category_code == "35"
        vmci_dispenser_interface_alarm_type
      elsif @alarm_category_code == "36"
        vmc_alarm_type
      elsif @alarm_category_code == "99"
        external_alarm_type
      else
        StandardError.new("alarm_category_code '#{alarm_category_code}' not defined")
      end
    end

    def sensor_category
      case @sensor_category_code
      when "00"
        "Other"
      when "01"
        "Annular"
      when "02"
        "Dispenser Pan"
      when "03"
        "Monitoring Well"
      when "04"
        "STP Sump"
      when "05"
        "Piping Sump"
      end
    end

    def alarm_state
      case @alarm_state_code
      when "01"
        "Cleared"
      else
        "Open"
      end
    end

    private

    # alarm_category_code 01
    def system_alarm_type
      case @alarm_type_number
      when "01"
        "Printer out of Paper"
      when "02"
        "Printer Error"
      when "03"
        "EEPROM Configuration Error"
      when "04"
        "Battery Off"
      when "05"
        "Too Many Tanks"
      when "06"
        "System Security Warning"
      when "07"
        "ROM Revision Warning"
      when "08"
        "Remote Display Communications Error"
      when "09"
        "Autodial Error"
      when "10"
        "Software Module Warning"
      when "11"
        "Tank Test Shutdown Warning"
      when "12"
        "Protective Cover Alarm"
      when "13"
        "BIR Shift Close Pending"
      when "14"
        "BIR Daily Close Pending"
      when "15"
        "PC(H8) Revision Warning"
      when "16"
        "System Self Test Error"
      when "17"
        "System Clock Incorrect Warning"
      when "18"
        "System Device Poll Timeout"
      when "19"
        "Maintenance Tracker NVMem Removed"
      when "20"
        "Maintenance Tracker Communication Module Removed"
      end
    end

    # alarm_category_code 02
    def tank_alarm_type
      case @alarm_type_number
      when "01"
        "Tank Setup Data Warning"
      when "02"
        "Tank Leak Alarm"
      when "03"
        "Tank High Water Alarm"
      when "04"
        "Tank Overfill Alarm"
      when "05"
        "Tank Low Product Alarm"
      when "06"
        "Tank Sudden Loss Alarm"
      when "07"
        "Tank High Product Alarm"
      when "08"
        "Tank Invalid Fuel Level Alarm"
      when "09"
        "Tank Probe Out Alarm"
      when "10"
        "Tank High Water Warning"
      when "11"
        "Tank Delivery Needed Warning"
      when "12"
        "Tank Maximum Product Alarm"
      when "13"
        "Tank Gross Leak Test Fail Alarm"
      when "14"
        "Tank Periodic Leak Test Fail Alarm"
      when "15"
        "Tank Annual Leak Test Fail Alarm"
      when "16"
        "Tank Periodic Test Needed Warning"
      when "17"
        "Tank Annual Test Needed Warning"
      when "18"
        "Tank Periodic Test Needed Alarm"
      when "19"
        "Tank Annual Test Needed Alarm"
      when "20"
        "Tank Leak Test Active"
      when "21"
        "Tank No CSLD Idle Time Warning"
      when "22"
        "Tank Siphon Break Active Warning"
      when "23"
        "Tank CSLD Rate Increase Warning"
      when "24"
        "Tank AccuChart Calibration Warning"
      when "25"
        "Tank HRM Reconciliation Warning"
      when "26"
        "Tank HRM Reconciliation Alarm"
      when "27"
        "Tank Cold Temperature Warning"
      when "28"
        "Tank Missing Delivery Ticket Warning"
      when "29"
        "Tank/Line Gross Leak Alarm"
      when "30"
        "Delivery Density Warning"
      end
    end

    # alarm_category_codes 03, 04, 07, 08, 12, 13
    def sensor_alarm_type
      case @alarm_type_number
      when "02"
        "Sensor Setup Data Warning"
      when "03"
        "Sensor Fuel Alarm"
      when "04"
        "Sensor Out Alarm"
      when "05"
        "Sensor Short Alarm"
      when "06"
        "Sensor Water Alarm"
      when "07"
        "Sensor Water Out Alarm"
      when "08"
        "Sensor High Liquid Alarm"
      when "09"
        "Sensor Low Liquid Alarm"
      when "10"
        "Sensor Liquid Warning"
      end
    end

    # alarm_category_code 05
    def input_alarm_type
      case @alarm_type_number
      when "01"
        "Input Setup Data Warning"
      when "02"
        "Input Normal"
      when "03"
        "Input Alarm"
      end
    end

    # alarm_category_code 06
    def volumetric_link_leak_alarm_type
      case @alarm_type_number
      when "01"
        "VLLD Setup Data Warning"
      when "02"
        "VLLD Self Test Alarm"
      when "03"
        "VLLD Shutdown Alarm"
      when "04"
        "VLLD Leak Test Fail Alarm"
      when "05"
        "VLLD Selftest Invalid Warning"
      when "06"
        "VLLD Continuous Handle On Warning"
      when "07"
        "VLLD Gross Line Test Fail Alarm"
      when "08"
        "VLLD Gross Line Selftest Fail Alarm"
      when "09"
        "VLLD Gross Pump Test Fail Alarm"
      when "10"
        "VLLD Gross Pump Selftest Fail Alarm"
      when "11"
        "VLLD Periodic Test Needed Warning"
      when "12"
        "VLLD Annual Test Needed Warning"
      when "13"
        "VLLD Periodic Test Needed Alarm"
      when "14"
        "VLLD Annual Test Needed Alarm"
      when "15"
        "VLLD Periodic Line Test Fail Alarm"
      when "16"
        "VLLD Periodic Line Selftest Fail Alarm"
      when "17"
        "VLLD Periodic Pump Test Fail Alarm"
      when "18"
        "VLLD Periodic Pump Selftest Fail Alarm"
      when "19"
        "VLLD Annual Line Test Fail Alarm"
      when "20"
        "VLLD Annual Line Selftest Fail Alarm"
      when "21"
        "VLLD Annual Pump Test Fail Alarm"
      when "22"
        "VLLD Annual Pump Selftest Fail Alarm"
      when "23"
        "VLLD Pressure Warning"
      when "24"
        "VLLD Pressure Alarm"
      when "25"
        "VLLD Gross Test Fault Alarm"
      when "26"
        "VLLD Periodic Test Fault Alarm"
      when "27"
        "VLLD Annual Test Fault Alarm"
      when "28"
        "VLLD Fuel Out Alarm"
      end
    end

    # alarm_category_code 14
    def auto_dial_alarm_type
      case @alarm_type_number
      when "01"
        "Autodial Setup Data Warning"
      when "02"
        "Autodial Failed Alarm"
      when "03"
        "Autodial Service Report Warning"
      when "04"
        "Autodial Alarm Clear Warning"
      when "05"
        "Autodial Delivery Report Warning"
      end
    end

    # alarm_category_codes 18, 19
    def mechanical_dispenser_interface_alarm_type
      case @alarm_type_number
      when "02"
        "DIM Disabled Alarm"
      when "03"
        "DIM Communication Failure Alarm"
      when "04"
        "DIM Transaction Alarm"
      end
    end

    # alarm_category_code 20
    def product_alarm_type
      case @alarm_type_number
      when "01"
        "BIR Setup Data Warning"
      when "02"
        "BIR Threshold Alarm"
      when "03"
        "BIR Close Shift Warning"
      when "04"
        "BIR Close Daily Warning"
      end
    end

    # alarm_category_code 21
    def pressure_lld_alarm_type
      case @alarm_type_number
      when "01"
        "PLLD Setup Data Warning"
      when "02"
        "PLLD Gross Test Fail Alarm"
      when "03"
        "PLLD Annual Test Fail Alarm"
      when "04"
        "PLLD Periodic Test Needed Warning"
      when "05"
        "PLLD Periodic Test Needed Alarm"
      when "06"
        "PLLD Sensor Open Alarm"
      when "07"
        "PLLD High Pressure Alarm"
      when "08"
        "PLLD Shutdown Alarm"
      when "09"
        "PLLD High Pressure Warning"
      when "10"
        "PLLD Continuous Handle On Warning"
      when "11"
        "PLLD Periodic Test Fail Alarm"
      when "12"
        "PLLD Annual Test Needed Warning"
      when "13"
        "PLLD Annual Test Needed Alarm"
      when "14"
        "PLLD Low Pressure Alarm"
      when "15"
        "PLLD Sensor Short Alarm"
      when "16"
        "PLLD Continuous Handle On Alarm"
      when "17"
        "PLLD Fuel Out Alarm"
      when "18"
        "PLLD Line Equipment Alarm"
      end
    end

    # alarm_category_code 26
    def wireless_plld_alarm_type
      case @alarm_type_number
      when "01"
        "WPLLD Setup Data Warning"
      when "02"
        "WPLLD Gross Test Fail Alarm"
      when "03"
        "WPLLD Periodic Test Fail Alarm"
      when "04"
        "WPLLD Periodic Test Needed Warning"
      when "05"
        "WPLLD Periodic Test Needed Alarm"
      when "06"
        "WPLLD Sensor Open Alarm"
      when "07"
        "WPLLD Communications Alarm"
      when "08"
        "WPLLD Shutdown Alarm"
      when "09"
        "WPLLD Continuous Handle On Warning"
      when "10"
        "WPLLD Annual Test Fail Alarm"
      when "11"
        "WPLLD Annual Test Needed Warning"
      when "12"
        "WPLLD Annual Test Needed Alarm"
      when "13"
        "WPLLD High Pressure Warning"
      when "14"
        "WPLLD High Pressure Alarm"
      when "15"
        "WPLLD Sensor Short Alarm"
      when "16"
        "WPLLD Continuous Handle On Alarm"
      when "17"
        "WPLLD Fuel Out Alarm"
      when "18"
        "WPLLD Line Equipment Alarm"
      end
    end

    # alarm_category_code 28
    def smart_sensor_alarm_type
      case @alarm_type_number
      when "01"
        "Smart Sensor Setup Data Warning"
      when "02"
        "Smart Sensor Communication Alarm"
      when "03"
        "Smart Sensor Fault Alarm"
      when "04"
        "Smart Sensor Fuel Warning"
      when "05"
        "Smart Sensor Fuel Alarm"
      when "06"
        "Smart Sensor Water Warning"
      when "07"
        "Smart Sensor Water Alarm"
      when "08"
        "Smart Sensor High Liquid Warning"
      when "09"
        "Smart Sensor High Liquid Alarm"
      when "10"
        "Smart Sensor Low Liquid Warning"
      when "11"
        "Smart Sensor Low Liquid Alarm"
      when "12"
        "Smart Sensor Temperature Warning"
      when "13"
        "Smart Sensor Relay Active"
      when "14"
        "Smart Sensor Install Alarm"
      when "15"
        "Smart Sensor Sensor Fault Warning"
      when "16"
        "Smart Sensor Vacuum Warning"
      when "17"
        "Smart Sensor No Vacuum Warning"
      end
    end

    # alarm_category_code 29
    def modbus_alarm_type
      case @alarm_type_number
      when "01"
        "Improper Setup Alarm"
      when "02"
        "Communication Loss Alarm"
      end
    end

    # alarm_category_code 30
    def isd_site_alarm_type
      case @alarm_type_number
      when "01"
        "Stage 1 Transfer Monitoring Failure Warning"
      when "02"
        "Containment Monitoring Gross Failure Warning"
      when "03"
        "Containment Monitoring Gross Failure Alarm"
      when "04"
        "Containment Monitoring Degradation Failure Warning"
      when "05"
        "Containment Monitoring Degradation Failure Alarm"
      when "06"
        "Containment Monitoring CVLD Failure Warning"
      when "07"
        "Containment Monitoring CVLD Failure Alarm"
      when "08"
        "Vapor Processor Over Pressure Failure Warning"
      when "09"
        "Vapor Processor Over Pressure Failure Alarm"
      when "10"
        "Vapor Processor Status Test Warning"
      when "11"
        "Vapor Processor Status Test Alarm"
      when "12"
        "Missing Relay Setup Alarm"
      when "13"
        "Missing Hose Setup Alarm"
      when "14"
        "Missing Tank Setup Alarm"
      when "15"
        "Missing Vapor Flow Meter Alarm"
      when "16"
        "Missing Vapor Pressure Sensor Alarm"
      when "17"
        "Missing Vapor Pressure Input Alarm"
      when "18"
        "Setup Fail Warning"
      when "19"
        "Setup Fail Alarm"
      when "20"
        "Sensor Out Warning"
      when "21"
        "Sensor Out Alarm"
      when "22"
        "PC-ISD Offline"
      end
    end

    # alarm_category_code 31
    def isd_hose_alarm_type
      case @alarm_type_number
      when "01"
        "Collection Monitoring Gross Failure Warning"
      when "02"
        "Collection Monitoring Gross Failure Alarm"
      when "03"
        "Collection Monitoring Degradation Failure Warning"
      when "04"
        "Collection Monitoring Degradation Failure Alarm"
      when "05"
        "Flow Performance Hose Blockage Failure Warning"
      when "06"
        "Flow Performance Hose Blockage Failure Alarm"
      when "07"
        "Vapor Flow Meter Setup alarm"
      end
    end

    # alarm_category_code 32
    def isd_vapor_flow_meter_alarm_type
      case @alarm_type_number
      when "01"
        "Locked rotor alarm"
      end
    end

    # alarm_category_code 33
    def pmc_alarm_type
      case @alarm_type_number
      when "01"
        "Vapor Processor Run Time Fault Warning"
      when "02"
        "Processor Monitoring Effluent Emissions Failure Warning"
      when "03"
        "Processor Monitoring Effluent Emissions Failure Alarm"
      when "04"
        "Processor Monitoring Over Pressure Failure Warning"
      when "05"
        "Processor Monitoring Over Pressure Failure Alarm"
      when "06"
        "Processor Monitoring Duty Cycle Failure Warning"
      when "07"
        "Processor Monitoring Duty Cycle Failure Alarm"
      when "08"
        "PMC (stand alone mode only) Setup Warning"
      end
    end

    # alarm_category_code 34
    def pump_relay_monitor_alarm_type
      case @alarm_type_number
      when "01"
        "Setup Data Warning"
      when "02"
        "Pump Relay Alarm"
      end
    end

    # alarm_category_code 35
    def vmci_dispenser_interface_alarm_type
      case @alarm_type_number
      when "01"
        "Setup Data Warning"
      when "02"
        "Disabled VMCI Alarm"
      end
    end

    # alarm_category_code 36
    def vmc_alarm_type
      case @alarm_type_number
      when "01"
        "VMC Comm timeout"
      when "02"
        "Meter Not Connected"
      when "03"
        "FP Shutdown Warning"
      when "04"
        "FP Shutdown Alarm"
      end
    end

    # alarm_category_code 99
    def external_alarm_type
      case @alarm_type_number
      when "01"
        "Externally Dectected Communication Alarm"
      when "02"
        "Communications - Data Reception Timeout"
      when "03"
        "Communications - Failed Checksum "
      when "04"
        "Communications - Parity Error"
      when "05"
        "Modem - Line Busy"
      when "06"
        "Modem - No Answer"
      when "07"
        "Modem - No Carrier"
      when "08"
        "Modem - No Dial Tone"
      when "09"
        "Modem - Modem Error"
      when "10"
        "Modem - Modem Not Responding"
      when "11"
        "Modem - Port Not Available"
      when "12"
        "Polling - Could Not Update Queue"
      when "13"
        "Polling - Invalid Data Type Requested"
      end
    end
  end
end
