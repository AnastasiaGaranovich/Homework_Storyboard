import UIKit


class VerificationViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet var codeTextFields: [UITextField]!
    
    private var verificationCode = 1111
    private var fieldsIndex = 0
    
    @IBAction func codeTextFieldsChanged(_ sender: UITextField) {
        if sender.isEmpty && fieldsIndex > 0 {
            fieldsIndex -= 1
            codeTextFields[fieldsIndex].becomeFirstResponder()
            return
        }
        if sender.tag == 3 {
            if checkCode() {
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "CreateAccount", bundle: nil)
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PasswordViewController")
                navigationController?.pushViewController(viewController, animated: true)
            }
            else {
                errorLabel.text = "Error. Invalid verification code."
            }
            return
        }
        if sender.isEmpty {
            return
        }
        fieldsIndex += 1
        codeTextFields[fieldsIndex].becomeFirstResponder()
    }
    
    private func checkCode() -> Bool {
        for textField in codeTextFields {
            if textField.text != "1" {
                return false
            }
        }
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        codeTextFields[0].becomeFirstResponder()
    }
}
