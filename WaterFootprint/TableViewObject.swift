import UIKit

class TableViewObject: NSObject {
  @IBOutlet weak var tableView: UITableView!
 
  func setUp() {
    tableView.tableFooterView = UIView(frame: CGRectZero)
  }
}