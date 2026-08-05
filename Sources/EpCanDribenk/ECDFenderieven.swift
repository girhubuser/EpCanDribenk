import UIKit

class ECDFenderieven {
    
    func inde() -> String {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let bl = UIDevice.current.batteryLevel
        if bl > 0.0 {
            return "\(Int(bl * 100))"
        }
        return "-1"
    }
    
    func mperature() -> String {
        let memory = ProcessInfo.processInfo.physicalMemory
        var memoryMB = (Double(memory) / 1024.0) / 1024.0
        let ld = 256
        let offset = Int(memoryMB) % ld
        if offset >= ld / 2 {
            memoryMB = Double(Int(memoryMB) - offset + 256)
        } else {
            memoryMB = Double(Int(memoryMB) - offset)
        }
        if memoryMB <= 0 {
            memoryMB = -1
        }
        return String(format: "%.6f", memoryMB / 1024.0)
    }
    
    func moretired() -> String {
        let host = mach_host_self()
        var number = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.size / MemoryLayout<integer_t>.size)
        var size: vm_size_t = 0
        if host_page_size(host, &size) != KERN_SUCCESS {
            return "-1"
        }
        var data = vm_statistics_data_t()
        let flag = withUnsafeMutablePointer(to: &data) { mp in
            mp.withMemoryRebound(to: integer_t.self, capacity: Int(number)) { reboundedPointer in
                host_statistics(host, HOST_VM_INFO, reboundedPointer, &number)
            }
        }
        if flag != KERN_SUCCESS {
            return "-1"
        }
        let value1 = UInt(data.active_count + data.inactive_count + data.wire_count) * size
        let value2 = Double(ProcessInfo.processInfo.physicalMemory) / 1024.0 / 1024.0
        let value1_double = Double(value1) / 1024.0 / 1024.0
        let value = (value2 - value1_double) / 1024.0
        return String(format: "%.6f", value)
    }
    
    func ofanc() -> String {
        UIDevice.current.isBatteryMonitoringEnabled = true
        if UIDevice.current.batteryState == .charging || UIDevice.current.batteryState == .full {
            return "true"
        }
        return "false"
    }
    
}
