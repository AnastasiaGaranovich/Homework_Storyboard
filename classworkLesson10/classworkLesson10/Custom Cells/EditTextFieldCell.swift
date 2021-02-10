import UIKit

protocol EditTextFieldCellDelegate: class {
    func didPressButton(user: User)
}

class EditTextFieldCell: UITableViewCell {
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var editDoneButton: UIButton!
    
    var cellDelegate: EditTextFieldCellDelegate?
    var user: User!
    
    @IBAction func editDoneButtonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(user: user)
    }
}
