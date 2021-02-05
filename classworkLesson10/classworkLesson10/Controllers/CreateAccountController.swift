import UIKit


class CreateAccountController: UIViewController {
    
    @IBAction func SignInReturned(_ sender: UIButton) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController")
        self.view.window?.rootViewController = viewController
        self.view.window?.makeKeyAndVisible()
    }
}
