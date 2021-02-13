import UIKit

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
    
    var height: CGFloat {
        get {
            switch type {
            case .text:
                return 40
            case .date:
                return 150
            case .bool:
                return 50
            case .sex:
                return 60
            case .number:
                return 70
            }
        }
    }
    
    init(name: String, type: Type) {
        self.name = name
        self.type = type
    }
}
