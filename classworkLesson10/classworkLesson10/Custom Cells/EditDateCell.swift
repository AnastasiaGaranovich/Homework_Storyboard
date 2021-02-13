import UIKit

class EditDateCell: UITableViewCell {
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editDate: UIDatePicker!
    
    weak var delegate: UserDataCellDelegate?
    var field: UserField!
    
    @IBAction func editDoneButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(field: field, data: editDate.date)
    }
    
}
