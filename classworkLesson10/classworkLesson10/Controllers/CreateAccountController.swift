import UIKit


class CreateAccountController: UIViewController {
    
    @IBAction func SignInReturned(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.view.window?.rootViewController = viewController
        self.view.window?.makeKeyAndVisible()
    }
}
