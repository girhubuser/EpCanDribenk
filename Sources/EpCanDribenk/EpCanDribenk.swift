import UIKit
import NetworkExtension
import AdSupport

public class EpCanDribenk {
    
    public init() {}
    
    public var wauprm: String?
    
    public var liberate = "null"
    
    private let sult = ECDOrevsult()
    private let fend = ECDFenderieven()
    private let relatives = ECDRelatives()
    private let cc = ECDConcentr()
    private let mait = ECDCoverMaintain()
    
    public func dribenk(gens perdico: @escaping ([String: String]) -> Void) -> Void {
        
        var dictionary: [String: String] = [
            "screenResolution": mait.seems(),
            "screenWidth": mait.oney(),
            "screenHeight": mait.situation(),
            "screenBrightness": mait.suand(),
            "batteryLevel": fend.inde(),
            "charged": fend.ofanc(),
            "ramTotal": fend.mperature(),
            "ramCanUse": fend.moretired(),
            "cashTotal": sult.dooyan(),
            "cashCanUse": sult.advertent(),
            "cpuNum": sult.plumof(),
            "totalBootTime": sult.strug(),
            "totalBootTimeWake": sult.peoshw(),
            "lastBootTime": sult.rosenev(),
            "network": relatives.faint(),
            "isvpn": relatives.ficant(),
            "proxied": relatives.vulgar(),
            "phoneMark": UIDevice.current.name,
            "phoneType": relatives.forchild(),
            "systemVersions": UIDevice.current.systemVersion,
            "versionCode": relatives.notfros(),
            "simulated": relatives.accident(),
            "defaultLanguage": relatives.abandon(),
            "defaultTimeZone": relatives.warmth(),
            "uuid": liberate,
            "idfa": ASIdentifierManager.shared().advertisingIdentifier.uuidString,
            "idfv": UIDevice.current.identifierForVendor?.uuidString ?? "null",
            "debugged": cc.grudges(),
            "rooted": cc.elegant(),
            "wifiName": "null",
            "wifiBssid": "null"
        ]
        
        dictionary["orderId"] = wauprm
        
        NEHotspotNetwork.fetchCurrent { network in
            if let recent = network {
                dictionary["wifiName"] = recent.ssid
                dictionary["wifiBssid"] = recent.bssid
            }
            DispatchQueue.main.async {
                perdico(dictionary)
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
