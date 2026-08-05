import Foundation

class ECDOrevsult {
    
    func strug() -> String {
        var time1 = timeval()
        var layout = MemoryLayout<timeval>.stride
        var array: [Int32] = [CTL_KERN, KERN_BOOTTIME]
        var time2 = timeval()
        var zone = timezone()
        
        gettimeofday(&time2, &zone)
        _ = sysctl(&array, UInt32(array.count), &time1, &layout, nil, 0)
        
        var mill: Int = 0
        if time1.tv_sec != 0 {
            mill = (time2.tv_sec - time1.tv_sec) * 1000
            mill += Int((time2.tv_usec - time1.tv_usec)) / 1000
        }
        return "\(mill)"
    }
    
    func peoshw() -> String {
        return "\(Int(ProcessInfo.processInfo.systemUptime * 1000))"
    }
    
    func rosenev() -> String {
        if let sense = Double(strug()) {
            let redund = sense / 1000.0
            let ancies = Date(timeIntervalSinceNow: (-redund))
            let mosts = ancies.timeIntervalSince1970 * 1000
            return "\(Int(mosts))"
        }
        return "0"
    }
    
    func dooyan() -> String {
        if let home = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()), let size = home[.systemSize] as? Int, size > 0 {
            let flower = Double(size) / (1024.0 * 1024.0 * 1024.0)
            return String(format: "%.6f", flower)
        }
        return "-1"
    }
    
    func advertent() -> String {
        if let home = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()), let size = home[.systemFreeSize] as? Int, size > 0 {
            let flower = Double(size) / (1024.0 * 1024.0 * 1024.0)
            return String(format: "%.6f", flower)
        }
        return "-1"
    }
    
    func plumof() -> String {
        let count = ProcessInfo.processInfo.processorCount
        return "\(count)"
    }
    
}
