import UIKit

protocol EditDateCellDelegate: class {
    func didPressButton(user: User)
}

class EditDateCell: UITableViewCell {
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var editDate: UIDatePicker!
    @IBOutlet weak var editButtonDone: UIButton!
    
    var cellDelegate: EditDateCellDelegate?
    var user: User!
    
    @IBAction func editDoneButtonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(user: user)
    }
    
}
