import UIKit

extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
    var hasValidEmail: Bool {
        guard let email = text else {
            print("Error. No email")
            return false
        }
        return email.isValidEmail
    }
}

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}


