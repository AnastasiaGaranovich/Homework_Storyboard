import UIKit

protocol UserDataCellDelegate: class {
    func didPressButton(user: User)
}

class UserDataCell: UITableViewCell {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var usersDataLabel: UILabel!
    @IBOutlet weak var editDataButton: UIButton!
    
    var cellDelegate: UserDataCellDelegate?
    var user: User!
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(user: user)
    }
    
}
