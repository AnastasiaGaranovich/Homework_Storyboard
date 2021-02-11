import UIKit

class UserDataViewController: UIViewController, UserDataCellDelegate, EditTextFieldCellDelegate {
    
    let array = [
        UserField(name: "Name"),
        UserField(name: "Surname"),
        UserField(name: "Date of birth"),
        UserField(name: "Sex"),
        UserField(name: "Smoking"),
        UserField(name: "Vegetarian"),
        UserField(name: "Kids")]
    
    @IBOutlet weak var tableView: UITableView!
    
    func didPressButton(user: User) {
        
    }
    
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        showController(storyboard: "SignIn", name: "SignInViewController")
    }
    
    @IBAction func deleteAccountButtonPressed(_ sender: UIButton) {
        
        showController(storyboard: "SignIn", name: "SignInViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserDataCell", bundle: nil), forCellReuseIdentifier: "UserDataCell")
    }
}

extension UserDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataCell", for: indexPath) as! UserDataCell
//        let user = User()
//        cell.profileLabel.text = "Name"
//        cell.usersDataLabel.text = user.name
        let fieldName = array[indexPath.row].name
        cell.profileLabel.text = fieldName
        cell.usersDataLabel.text = AppData.user.getData(fieldName: fieldName)
        return cell
    }
}
