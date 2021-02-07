import Foundation

enum Sex: Int, Codable {
    case man
    case woman
}

class User: Codable {
    var login = ""
    var password = ""
    var name = ""
    var surname = ""
    var dateOfBirth = Date()
    var amountOfChildren = 0
    var smoking = false
    var vegetarian = false
    var sex = Sex.man
    
    init() {
    }
}
