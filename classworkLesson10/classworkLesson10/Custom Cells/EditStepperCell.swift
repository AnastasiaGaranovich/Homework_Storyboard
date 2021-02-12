import UIKit

class EditStepperCell: UITableViewCell {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editKidsLabel: UILabel!
    @IBOutlet weak var editStepper: UIStepper!
    
    
    weak var delegate: UserDataCellDelegate?
    var field: UserField!
    
    @IBAction func editStepperChanged(_ sender: UIStepper) {
        editKidsLabel.text = Int(sender.value).description
    }
    
    @IBAction func editDoneButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(field: field)
    }
}
