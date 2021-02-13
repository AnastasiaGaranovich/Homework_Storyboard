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

enum PasswordStrength {
    case short
    case noDigits
    case valid
}

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    var containsNumber: Bool {
        return rangeOfCharacter(from: .decimalDigits) != nil
    }
    var passwordStrength: PasswordStrength {
        if count < 8 {
            return .short
        }
        if !containsNumber {
            return .noDigits
        }
        return .valid
    }
}

extension UIViewController {
    func getControllerFrom(storyboard: String, name: String) -> UIViewController {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: name)
    }
    func pushController(storyboard: String, name: String) {
        navigationController?.pushViewController(getControllerFrom(storyboard: storyboard, name: name), animated: true)
    }
    func pushController(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    func showController(storyboard: String, name: String) {
        view.window?.rootViewController = getControllerFrom(storyboard: storyboard, name: name)
        view.window?.makeKeyAndVisible()
    }
    func showController(viewController: UIViewController) {
        view.window?.rootViewController = viewController
        view.window?.makeKeyAndVisible()
    }
}

extension Bool {
    var toString: String {
        if self {
            return "Yes"
        }
        else {
            return "No"
        }
    }
}
