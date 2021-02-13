import UIKit

class EditSwitchCell: UITableViewCell {
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editSwitch: UISwitch!
    
    weak var delegate: UserDataCellDelegate?
    var field: UserField!
    
    @IBAction func editDoneButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(field: field, data: editSwitch.isOn)
    }
}
