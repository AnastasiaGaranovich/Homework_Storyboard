import Foundation

enum Type {
    case text
    case date
    case bool
    case number
    case sex
}

class UserField {
    let name: String
    let type: Type
    var editing = false
    
    init(name: String, type: Type) {
        self.name = name
        self.type = type
    }
}
