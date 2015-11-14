import UIKit

class TableViewObject: NSObject {
  @IBOutlet weak var tableView: UITableView!
  var dataSource: TableViewDataSource?
  @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
  let underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()
  
  func setUp() {
    tableView.tableFooterView = UIView(frame: CGRectZero)
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
    
    // Get the table from under the keyboard when it appears
    if let superview = tableView.superview {
      underKeyboardLayoutConstraint.setup(bottomLayoutConstraint,
        view: superview, bottomLayoutGuide: nil)
    }
  }
  
  func showData(models: [ProductModel]) {
    dataSource = TableViewDataSource(models: models)
    tableView.dataSource = dataSource
  }
}