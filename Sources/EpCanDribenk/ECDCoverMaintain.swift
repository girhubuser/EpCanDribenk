import UIKit

class ECDCoverMaintain {
    
    func seems() -> String {
        let scale = UIScreen.main.scale
        let w = Int(UIScreen.main.bounds.size.width * scale)
        let h = Int(UIScreen.main.bounds.size.height * scale)
        return "\(w)-\(h)"
    }
    
    func oney() -> String {
        let scale = UIScreen.main.scale
        return "\(Int(UIScreen.main.bounds.size.width * scale))"
    }
    
    func situation() -> String {
        let scale = UIScreen.main.scale
        return "\(Int(UIScreen.main.bounds.size.height * scale))"
    }
    
    func suand() -> String {
        let value = UIScreen.main.brightness
        if value < 0 || value > 1 {
            return "-1"
        }
        return "\(Int(value * 100))"
    }
}
