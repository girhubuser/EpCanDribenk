import UIKit
import SystemConfiguration
import CoreTelephony

class ECDRelatives {
    
    func faint() -> String {
        let ted = sucish()
        switch ted {
        case "Unknown":
            return "0"
        case "WiFi":
            return "1"
        case "2G":
            return "2"
        case "3G":
            return "3"
        case "4G":
            return "4"
        case "5G":
            return "5"
        default:
            return "0"
        }
    }
    
    func ficant() -> String {
        guard let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any] else {
            return "false"
        }
        guard let scopedArray = settings["__SCOPED__"] as? [String: Any] else {
            return "false"
        }
        let array = ["tap", "tun", "ipsec", "ppp"]
        for key in scopedArray.keys {
            for string in array where key.contains(string) {
                return "true"
            }
        }
        return "false"
    }
    
    func vulgar() -> String {
        guard let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() else {
            return "false"
        }
        let array = CFNetworkCopyProxiesForURL(URL(string: "https://www.example.com")! as CFURL, settings).takeRetainedValue() as NSArray
        if array.count <= 0 {
            return "false"
        }
        guard let dic = array.object(at: 0) as? NSDictionary else {
            return "false"
        }
        guard let value = dic.object(forKey: kCFProxyTypeKey) as? String else {
            return "false"
        }
        return value == "kCFProxyTypeNone" ? "false" : "true"
    }
    
    private func sucish() -> String {
        var gance = sockaddr_in()
        gance.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        gance.sin_family = sa_family_t(AF_INET)
        let thearo = withUnsafePointer(to: &gance) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) { heroic in
                SCNetworkReachabilityCreateWithAddress(nil, heroic)
            }
        }
        var flags: SCNetworkReachabilityFlags = []
        guard let side = thearo, SCNetworkReachabilityGetFlags(side, &flags) else {
            return "Unknown"
        }
        let ep = flags.contains(.reachable)
        let phy = flags.contains(.connectionRequired)
        
        if !ep || phy {
            return "notReachable"
        }
        if flags.contains(.isWWAN) {
            return orphans()
        }
        return "WiFi"
    }
    
    private func orphans() -> String {
        let info = CTTelephonyNetworkInfo()
        var string: String?
        if let dic = info.serviceCurrentRadioAccessTechnology {
            if let key = Array(dic.keys).first, key.count > 0 {
                string = dic[key]
            }
        }
        guard let lear = string else {
            return "notReachable"
        }
        if lear == CTRadioAccessTechnologyNRNSA || lear == CTRadioAccessTechnologyNR {
            return "5G"
        }
        if lear == CTRadioAccessTechnologyLTE {
            return "4G"
        } else if [CTRadioAccessTechnologyWCDMA, CTRadioAccessTechnologyHSDPA, CTRadioAccessTechnologyHSUPA, CTRadioAccessTechnologyCDMAEVDORev0, CTRadioAccessTechnologyCDMAEVDORevA, CTRadioAccessTechnologyCDMAEVDORevB, CTRadioAccessTechnologyeHRPD].contains(lear) {
            return "3G"
        } else if [CTRadioAccessTechnologyEdge, CTRadioAccessTechnologyGPRS, CTRadioAccessTechnologyCDMA1x].contains(lear) {
            return "2G"
        } else {
            return "notReachable"
        }
    }
    
    func forchild() -> String {
        var name = utsname()
        uname(&name)
        let ref = Mirror(reflecting: name.machine)
        let string = ref.children.reduce("") { dull, aso in
            guard let value = aso.value as? Int8, value != 0 else { return dull }
            return dull + String(UnicodeScalar(UInt8(value)))
        }
        return satisfi(string: string)
    }
    
    func accident() -> String {
        let string = forchild()
        if string == "iPhone Simulator" {
            return "true"
        }
        return "false"
    }
    
    func notfros() -> String {
        return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "null"
    }
    
    func abandon() -> String {
        let array = Locale.preferredLanguages
        if array.count > 0 {
            let first = array[0]
            if first.count > 0 {
                let array = first.components(separatedBy: "-")
                return array.count > 0 ? array[0] : "null"
            }
        }
        return "null"
    }
    
    func warmth() -> String {
        return TimeZone.current.identifier
    }
    
    private func satisfi(string: String) -> String {
        
        if string == "i386" || string == "x86_64" || string == "arm64" {
            return "iPhone Simulator"
        }
        
        let dict: [String: String] = [
            "iPhone5,1": "iPhone 5", "iPhone5,2": "iPhone 5", "iPhone5,3": "iPhone 5c", "iPhone5,4": "iPhone 5c",
            "iPhone6,1": "iPhone 5s", "iPhone6,2": "iPhone 5s",
            "iPhone7,1": "iPhone 6 Plus", "iPhone7,2": "iPhone 6",
            "iPhone8,1": "iPhone 6s", "iPhone8,2": "iPhone 6s Plus", "iPhone8,4": "iPhone SE",
            "iPhone9,1": "iPhone 7", "iPhone9,2": "iPhone 7 Plus", "iPhone9,4": "iPhone 7 Plus",
            "iPhone10,1": "iPhone 8", "iPhone10,4": "iPhone 8", "iPhone10,2": "iPhone 8 Plus", "iPhone10,5": "iPhone 8 Plus",
            "iPhone10,3": "iPhone X", "iPhone10,6": "iPhone X",
            "iPhone11,8": "iPhone XR", "iPhone11,2": "iPhone XS", "iPhone11,6": "iPhone XS Max",
            "iPhone12,1": "iPhone 11", "iPhone12,3": "iPhone 11 Pro", "iPhone12,5": "iPhone 11 Pro Max", "iPhone12,8": "iPhone SE 2",
            "iPhone13,1": "iPhone 12 mini", "iPhone13,2": "iPhone 12", "iPhone13,3": "iPhone 12 Pro", "iPhone13,4": "iPhone 12 Pro Max",
            "iPhone14,4": "iPhone 13 mini", "iPhone14,5": "iPhone 13", "iPhone14,2": "iPhone 13 Pro", "iPhone14,3": "iPhone 13 Pro Max", "iPhone14,6": "iPhone SE 3",
            "iPhone14,7": "iPhone 14", "iPhone14,8": "iPhone 14 Plus",
            "iPhone15,2": "iPhone 14 Pro", "iPhone15,3": "iPhone 14 Pro Max",
            "iPhone15,4": "iPhone 15", "iPhone15,5": "iPhone 15 Plus",
            "iPhone16,1": "iPhone 15 Pro", "iPhone16,2": "iPhone 15 Pro Max",
            "iPhone17,3": "iPhone 16", "iPhone17,4": "iPhone 16 Plus",
            "iPhone17,1": "iPhone 16 Pro", "iPhone17,2": "iPhone 16 Pro Max", "iPhone17,5": "iPhone 16e",
            "iPhone18,1": "iPhone 17 Pro", "iPhone18,2": "iPhone 17 Pro Max",
            "iPhone18,3": "iPhone 17", "iPhone18,4": "iPhone Air", "iPhone18,5": "iPhone 17e"
        ]
        
        if let value = dict[string] {
            return value
        }
        
        if string == "iPad1,1" { return "iPad" }
        if ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"].contains(string) { return "iPad 2" }
        if ["iPad2,5", "iPad2,6", "iPad2,7"].contains(string) { return "iPad mini" }
        if ["iPad3,1", "iPad3,2", "iPad3,3"].contains(string) { return "iPad 3" }
        if ["iPad3,4", "iPad3,5", "iPad3,6"].contains(string) { return "iPad 4" }
        if ["iPad4,1", "iPad4,2", "iPad4,3"].contains(string) { return "iPad Air" }
        if ["iPad4,4", "iPad4,5", "iPad4,6"].contains(string) { return "iPad mini 2" }
        if ["iPad4,7", "iPad4,8", "iPad4,9"].contains(string) { return "iPad mini 3" }
        if ["iPad5,1", "iPad5,2"].contains(string) { return "iPad mini 4" }
        if ["iPad11,1", "iPad11,2"].contains(string) { return "iPad mini 5" }
        if ["iPad14,1", "iPad14,2"].contains(string) { return "iPad mini 6" }
        if ["iPad5,3", "iPad5,4"].contains(string) { return "iPad Air 2" }
        if ["iPad6,3", "iPad6,4"].contains(string) { return "iPad Pro (9.7-inch)" }
        if ["iPad6,7", "iPad6,8"].contains(string) { return "iPad Pro (12.9-inch)" }
        if ["iPad6,11", "iPad6,12"].contains(string) { return "iPad 5" }
        if ["iPad7,1", "iPad7,2"].contains(string) { return "iPad Pro 2 (12.9-inch)" }
        if ["iPad7,3", "iPad7,4"].contains(string) { return "iPad Pro (10.5-inch)" }
        if ["iPad7,5", "iPad7,6"].contains(string) { return "iPad 6" }
        if ["iPad7,11", "iPad7,12"].contains(string) { return "iPad 7" }
        if ["iPad11,6", "iPad11,7"].contains(string) { return "iPad 8" }
        if ["iPad12,1", "iPad12,2"].contains(string) { return "iPad 9" }
        if ["iPad11,3", "iPad11,4"].contains(string) { return "iPad Air 3" }
        if ["iPad13,1", "iPad13,2"].contains(string) { return "iPad Air 4" }
        if ["iPad13,6", "iPad13,7"].contains(string) { return "iPad Air 5" }
        if ["iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4"].contains(string) { return "iPad Pro (11-inch)" }
        if ["iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8"].contains(string) { return "iPad Pro 3 (12.9-inch)" }
        if ["iPad8,9", "iPad8,10"].contains(string) { return "iPad Pro 2 (11-inch)" }
        if ["iPad8,11", "iPad8,12"].contains(string) { return "iPad Pro 4 (12.9-inch)" }
        if ["iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7"].contains(string) { return "iPad Pro 3 (11-inch)" }
        if ["iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11"].contains(string) { return "iPad Pro 5 (12.9-inch)" }
        
        if string.hasPrefix("iPad") { return "iPad" }
        if string.hasPrefix("iPhone") { return "iPhone" }
        
        if string == "AppleTV2,1" { return "Apple TV 2" }
        if string == "AppleTV3,1" { return "Apple TV 3" }
        if string == "AppleTV3,2" { return "Apple TV 3 (2013)" }
        
        return string
    }
    
}
