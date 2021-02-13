import UIKit


class CreateAccountController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func SignInReturned(_ sender: UIButton) {
        showController(storyboard: "SignIn", name: "SignInViewController")
    }
    
    @IBAction func emailTextFieldChanged(_ sender: UITextField) {
        signUpButton.isHidden = signUpButtonHidden()
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        if let userEmail = emailTextField.text {
            AppData.user.login = userEmail
            let viewController = getControllerFrom(storyboard: "CreateAccount", name: "VerificationViewController") as! VerificationViewController
            viewController.storyboardName = "CreateAccount"
            viewController.controllerName = "PasswordViewController"
            pushController(viewController: viewController)
        }
    }
    
    private func signUpButtonHidden() -> Bool {
        if !emailTextField.hasValidEmail {
            errorLabel.text = "Error. Invalid email"
            return true
        }
        errorLabel.text = ""
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
