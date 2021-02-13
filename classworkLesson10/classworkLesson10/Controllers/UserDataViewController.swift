import UIKit

class UserDataViewController: UIViewController {
    
    let array = [
        UserField(name: "Name", type: .text),
        UserField(name: "Surname", type: .text),
        UserField(name: "Date of birth", type: .date),
        UserField(name: "Sex", type: .sex),
        UserField(name: "Smoking", type: .bool),
        UserField(name: "Vegetarian", type: .bool),
        UserField(name: "Kids", type: .number)]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        Defaults.clearToken()
        showController(storyboard: "SignIn", name: "SignInNavigation")
    }
    
    @IBAction func deleteAccountButtonPressed(_ sender: UIButton) {
        Defaults.clearUser()
        showController(storyboard: "SignIn", name: "SignInNavigation")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserDataCell", bundle: nil), forCellReuseIdentifier: "UserDataCell")
        tableView.register(UINib(nibName: "EditTextFieldCell", bundle: nil), forCellReuseIdentifier: "EditTextFieldCell")
        tableView.register(UINib(nibName: "EditDateCell", bundle: nil), forCellReuseIdentifier: "EditDateCell")
        tableView.register(UINib(nibName: "EditSwitchCell", bundle: nil), forCellReuseIdentifier: "EditSwitchCell")
        tableView.register(UINib(nibName: "EditSegmControlCell", bundle: nil), forCellReuseIdentifier: "EditSegmControlCell")
        tableView.register(UINib(nibName: "EditStepperCell", bundle: nil), forCellReuseIdentifier: "EditStepperCell")
        tableView.separatorColor = UIColor.clear
    }
}

extension UserDataViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return array[indexPath.row].height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let field = array[indexPath.row]
        
        if field.editing == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataCell", for: indexPath) as! UserDataCell
            cell.delegate = self
            cell.field = field
            cell.profileLabel.text = field.name
            cell.usersDataLabel.text = AppData.user.getStringData(fieldName: field.name)
            return cell
        }
        if field.type == .text {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditTextFieldCell", for: indexPath) as! EditTextFieldCell
            cell.delegate = self
            cell.field = field
            cell.profileLabel.text = field.name
            cell.editTextField.text = AppData.user.getStringData(fieldName: field.name)
            return cell
        }
        if field.type == .date {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditDateCell", for: indexPath) as! EditDateCell
            cell.delegate = self
            cell.field = field
            cell.profileLabel.text = field.name
            cell.editDate.date = AppData.user.getData(fieldName: field.name) as! Date
            return cell
        }
        if field.type == .sex {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditSegmControlCell", for: indexPath) as! EditSegmControlCell
            cell.delegate = self
            cell.field = field
            cell.profileLabel.text = field.name
            cell.editSegmControl.selectedSegmentIndex =
                (AppData.user.getData(fieldName: field.name) as! Sex).rawValue
            return cell
        }
        if field.type == .bool {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditSwitchCell", for: indexPath) as! EditSwitchCell
            cell.delegate = self
            cell.field = field
            cell.profileLabel.text = field.name
            cell.editSwitch.isOn = AppData.user.getData(fieldName: field.name) as! Bool
            return cell
        }
        if field.type == .number {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EditStepperCell", for: indexPath) as! EditStepperCell
            cell.delegate = self
            cell.field = field
            cell.profileLabel.text = field.name
            cell.editStepper.value = Double(AppData.user.getData(fieldName: field.name) as! Int)
            cell.editKidsLabel.text = String(Int(cell.editStepper.value))
            return cell
        }
        return UITableViewCell()
    }
}

extension UserDataViewController: UserDataCellDelegate {
    
    func didPressButton(field: UserField, data: Any) {
        field.editing.toggle()
        tableView.reloadData()
        if field.editing {
            return
        }
        AppData.user.setData(fieldName: field.name, data: data)
        AppData.saveUser()
    }
}

