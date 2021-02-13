import UIKit

protocol UserDataCellDelegate: class {
    func didPressButton(field: UserField, data: Any)
}

class UserDataCell: UITableViewCell {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var usersDataLabel: UILabel!
    
    weak var delegate: UserDataCellDelegate?
    var field: UserField!
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(field: field, data: "")
    }
    
}
