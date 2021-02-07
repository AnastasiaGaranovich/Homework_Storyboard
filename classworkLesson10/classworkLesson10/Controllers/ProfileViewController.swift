import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var sexSegmControl: UISegmentedControl!
    @IBOutlet weak var smokingSwitch: UISwitch!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    @IBOutlet weak var kidsStepper: UIStepper!
    @IBOutlet weak var kidsLabel: UILabel!
    
    @IBAction func kidsAmountChanged(_ sender: UIStepper) {
        kidsLabel.text = Int(sender.value).description
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
        showController(storyboard: "MainScreen", name: "MainScreenViewController")
    }
    
    @IBAction func saveChangesButtonPressed(_ sender: UIButton) {
        AppData.user.name = nameTextField.text ?? ""
        AppData.user.surname = surnameTextField.text ?? ""
        AppData.user.dateOfBirth = dateOfBirth.date
        AppData.user.sex = Sex(rawValue: sexSegmControl.selectedSegmentIndex) ?? .man
        AppData.user.smoking = smokingSwitch.isOn
        AppData.user.vegetarian = vegetarianSwitch.isOn
        AppData.user.amountOfChildren = Int(kidsStepper.value)
        AppData.saveUser()
        showController(storyboard: "MainScreen", name: "MainScreenViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kidsStepper.wraps = true
        kidsStepper.autorepeat = true
        kidsStepper.maximumValue = 100
    }
    
}
