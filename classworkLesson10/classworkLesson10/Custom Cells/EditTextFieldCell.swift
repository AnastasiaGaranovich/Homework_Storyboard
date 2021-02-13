import UIKit

class EditTextFieldCell: UITableViewCell {
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editTextField: UITextField!
    
    weak var delegate: UserDataCellDelegate?
    var field: UserField!
    
    @IBAction func editDoneButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(field: field, data: editTextField.text ?? "")
    }
}
