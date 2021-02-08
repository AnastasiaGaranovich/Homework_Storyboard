import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func userDataButtonPressed(_ sender: UIButton) {
        showController(storyboard: "UserData", name: "UserDataViewController")
    }
    
}
