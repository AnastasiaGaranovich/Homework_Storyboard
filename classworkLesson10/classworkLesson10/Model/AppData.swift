import Foundation

class AppData {
    static var user = User()
    
    static func saveUser() {
        Defaults.user = user
    }
    static func loadUser() {
        user = Defaults.user
    }
}
