import Foundation

enum Sex: Int, Codable {
    case man
    case woman
    
    var toString: String {
        switch self {
        case .man:
            return "Man"
        case .woman:
            return "Woman"
        }
    }
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
    
    func getStringData(fieldName: String) -> String {
        switch fieldName {
        case "Name":
            return name
        case "Surname":
            return surname
        case "Date of birth":
            return dateOfBirth.description
        case "Sex":
            return sex.toString
        case "Smoking":
            return smoking.toString
        case "Vegetarian":
            return vegetarian.toString
        case "Kids":
            return amountOfChildren.description
        default:
            return "Error"
        }
    }
    
    func getData(fieldName: String) -> Any {
        switch fieldName {
        case "Name":
            return name
        case "Surname":
            return surname
        case "Date of birth":
            return dateOfBirth
        case "Sex":
            return sex
        case "Smoking":
            return smoking
        case "Vegetarian":
            return vegetarian
        case "Kids":
            return amountOfChildren
        default:
            return "Error"
        }
    }
}
