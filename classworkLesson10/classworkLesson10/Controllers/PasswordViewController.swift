import UIKit


class PasswordViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var finishRegistrationButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var redColorView: UIView!
    @IBOutlet weak var yellowColorView: UIView!
    @IBOutlet weak var greenColorView: UIView!
    
    @IBAction func passwordTextFiledChanged(_ sender: UITextField) {
        finishRegistrationButton.isHidden = finishRegistrationButtonHidden()
    }
    
    @IBAction func confirmPasswordTextFieldChanged(_ sender: UITextField) {
        finishRegistrationButton.isHidden = finishRegistrationButtonHidden()
    }
    
    @IBAction func finishRegistrationButtonPressed(_ sender: UIButton) {
        if let userPassword = passwordTextField.text {
            AppData.user.password = userPassword
            AppData.saveUser()
            showController(storyboard: "Profile", name: "ProfileViewController")
        }
    }
    
    private func finishRegistrationButtonHidden() -> Bool {
        guard let password = passwordTextField.text else {
            return true
        }
        switch password.passwordStrength {
        case .short:
            errorLabel.text = "Password is too short"
            redColorView.backgroundColor = .red
            yellowColorView.backgroundColor = .lightGray
            greenColorView.backgroundColor = .lightGray
            return true
        case .noDigits:
            errorLabel.text = "Password must contain digits"
            redColorView.backgroundColor = .red
            yellowColorView.backgroundColor = .yellow
            greenColorView.backgroundColor = .lightGray
            return true
        case .valid:
            redColorView.backgroundColor = .red
            yellowColorView.backgroundColor = .yellow
            greenColorView.backgroundColor = .green
            if passwordTextField.text != confirmPasswordTextField.text {
                errorLabel.text = "Error. Passwords do not match."
                return true
            }
            errorLabel.text = ""
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.text = AppData.user.login
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        if self.isMovingFromParent {
            navigationController?.popViewController(animated: true)
        }
    }
}
