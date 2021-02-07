import UIKit


class PasswordViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var finishRegistrationButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func passwordTextFiledChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func confirmPasswordTextFieldChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func finishRegistrationButtonPressed(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.text = Defaults.user.login
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
