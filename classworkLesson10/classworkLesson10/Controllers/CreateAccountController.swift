import UIKit


class CreateAccountController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func SignInReturned(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.view.window?.rootViewController = viewController
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func emailTextFieldChanged(_ sender: UITextField) {
        signUpButton.isHidden = signUpButtonHidden()
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        if let userEmail = emailTextField.text {
            let user = Defaults.user
            user.login = userEmail
            Defaults.user = user
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "CreateAccount", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "VerificationViewController")
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        return
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
