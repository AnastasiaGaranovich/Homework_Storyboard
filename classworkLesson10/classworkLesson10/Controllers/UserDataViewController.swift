import UIKit

class UserDataViewController: UITableViewController, UserDataCellDelegate, EditTextFieldCellDelegate {
    func didPressButton(user: User) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataCell", for: indexPath) as! UserDataCell
        let user = User()
        cell.profileLabel.text = "Name"
        cell.usersDataLabel.text = user.name
        return cell
    }
}
