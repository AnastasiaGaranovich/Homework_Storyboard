import UIKit

extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
}

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "CreateAccount", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CreateAccountController")
        self.view.window?.rootViewController = viewController
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func emailTextFieldChanged(_ sender: UITextField) {
        signInButton.isHidden = isEmptyTextField()
    }
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        signInButton.isHidden = isEmptyTextField()
    }
    
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
    }
    
    private func isEmptyTextField() -> Bool {
        return emailTextField.isEmpty || passwordTextField.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

