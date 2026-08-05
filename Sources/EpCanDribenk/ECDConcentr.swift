import Foundation

class ECDConcentr {
    let ptchs = [
        "/Applications/RockApp.app",
        "/Applications/Icy.app",
        "/usr/sbin/sshd",
        "/usr/bin/sshd",
        "/usr/libexec/sftp-server",
        "/Applications/WinterBoard.app",
        "/Applications/SBSettings.app",
        "/Applications/MxTube.app",
        "/Applications/IntelliScreen.app",
        "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
        "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
        "/private/var/lib/apt",
        "/private/var/stash",
        "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
        "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
        "/private/var/tmp/cydia.log",
        "/private/var/lib/cydia",
        "/etc/clutch.conf",
        "/var/cache/clutch.plist",
        "/etc/clutch_cracked.plist",
        "/var/cache/clutch_cracked.plist",
        "/var/lib/clutch/overdrive.dylib",
        "/var/root/Documents/Cracked/"
    ]
    
    func grudges() -> String {
        var proc = kinfo_proc()
        var array: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        proc.kp_proc.p_flag = 0
        var size = MemoryLayout<kinfo_proc>.size
        let value = sysctl(&array, UInt32(array.count), &proc, &size, nil, 0)
        if value > 0 {
            return "true"
        }
        return (proc.kp_proc.p_flag & P_TRACED) != 0 ? "true" : "false"
    }
    
    func elegant() -> String {
        var value: Int = 0
        if condition1() {
            value += 3
        }
        if condition2() {
            value += 2
        }
        if condition3() {
            value += 2
        }
        if condition4() {
            value += 2
        }
        if condition5() {
            value += 2
        }
        return value >= 3 ? "true" : "false"
    }
    
    private func condition1() -> Bool {
        let path = "/Applications/Cydia.app"
        return FileManager.default.fileExists(atPath: path)
    }
    
    private func condition2() -> Bool {
        for string in ptchs where FileManager.default.fileExists(atPath: string) {
            return true
        }
        return false
    }
    
    private func condition3() -> Bool {
        guard let path = Bundle.main.executablePath else { return true }
        guard let dic = Bundle.main.infoDictionary else { return true }
        if !FileManager.default.fileExists(atPath: path) {
            return true
        }
        if dic.keys.count <= 0 {
            return true
        }
        return false
    }
    
    private func condition4() -> Bool {
        var stat = stat()
        if lstat("/Applications", &stat) != 0 {
            return (stat.st_mode & S_IFLNK) != 0
        }
        return false
    }
    
    private func condition5() -> Bool {
        if let path = Bundle.main.executablePath {
            return FileManager.default.fileExists(atPath: path)
        }
        return false
    }
}
