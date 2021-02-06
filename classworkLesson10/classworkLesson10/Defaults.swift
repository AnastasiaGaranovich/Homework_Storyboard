import Foundation

class Defaults {
    private static var accessKey = "Access"
    static var token: Date? {
        get {
            return UserDefaults.standard.value(forKey: accessKey) as? Date
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: accessKey)
        }
    }
}
