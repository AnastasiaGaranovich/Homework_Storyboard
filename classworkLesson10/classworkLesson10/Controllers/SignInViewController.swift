import UIKit

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
        signInButton.isHidden = signInButtonHidden()
    }
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        signInButton.isHidden = signInButtonHidden()
    }
    
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
    }
    
    private func signInButtonHidden() -> Bool {
        return !emailTextField.hasValidEmail || passwordTextField.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

