import UIKit

protocol UserDataCellDelegate: class {
    func didPressButton(field: UserField)
}

class UserDataCell: UITableViewCell {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var usersDataLabel: UILabel!
    
    weak var delegate: UserDataCellDelegate?
    var field: UserField!
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(field: field)
    }
    
}
