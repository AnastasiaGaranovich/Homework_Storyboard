import Foundation

class User: Codable {
    var login = ""
    var name = ""
    var surname = ""
    var dateOfBirth = Date()
    var amountOfChildren = 0
    var smoking = false
    var vegetarian = false
    
    init() {
    }
}
