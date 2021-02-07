import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var saveTokenSwitch: UISwitch!
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        showController(storyboard: "CreateAccount", name: "CreateAccountNavigation")
    }
    
    @IBAction func emailTextFieldChanged(_ sender: UITextField) {
        signInButton.isHidden = signInButtonHidden()
    }
    @IBAction func passwordTextFieldChanged(_ sender: UITextField) {
        signInButton.isHidden = signInButtonHidden()
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        if saveTokenSwitch.isOn {
            Defaults.token = Date()
        }
        showController(storyboard: "MainScreen", name: "MainScreenViewController")
    }
    
    private func signInButtonHidden() -> Bool {
        if emailTextField.isEmpty || passwordTextField.isEmpty {
            errorLabel.text = "Error. Fill all fields."
            return true
        }
        if !emailTextField.hasValidEmail {
            errorLabel.text = "Error. Invalid email."
            return true
        }
        errorLabel.text = ""
        return false
    }
    
    private func checkToken() {
        guard let token = Defaults.token else {
            return
        }
        let secondsInMinute = 60
        let expiringToken = Int(Date().timeIntervalSince(token)) / secondsInMinute
        if expiringToken < 5 {
            signInButtonPressed(signInButton)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkToken()
    }
}

