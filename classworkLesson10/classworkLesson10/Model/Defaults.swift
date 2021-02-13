import Foundation

class Defaults {
    private static var accessKey = "Access"
    private static var userKey = "User"
    static var token: Date? {
        get {
            return UserDefaults.standard.value(forKey: accessKey) as? Date
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: accessKey)
        }
    }
    static var user: User {
        get {
            guard let userData = UserDefaults.standard.value(forKey: userKey) as? Data else {
                let user = User()
                UserDefaults.standard.set(try? PropertyListEncoder().encode(user), forKey: userKey)
                return user
            }
            return try! PropertyListDecoder().decode(User.self, from: userData)
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: userKey)
        }
    }
    static func clearUser() {
        UserDefaults.standard.set(nil, forKey: userKey)
    }
}
