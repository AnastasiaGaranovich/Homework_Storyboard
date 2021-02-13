import UIKit

class EditSegmControlCell: UITableViewCell {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editSegmControl: UISegmentedControl!
    
    weak var delegate: UserDataCellDelegate?
    var field: UserField!
    
    @IBAction func editDoneButtonPressed(_ sender: UIButton) {
        delegate?.didPressButton(field: field, data: editSegmControl.selectedSegmentIndex)
    }
}
