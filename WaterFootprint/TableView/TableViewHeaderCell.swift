import UIKit

class TableViewHaaderCell: UITableViewCell {
  @IBOutlet weak var separatorHeightConsraint: NSLayoutConstraint!
  
  func setup() {
    separatorHeightConsraint.constant = 1.0 / CGFloat(UIScreen.mainScreen().scale)
  }
}
