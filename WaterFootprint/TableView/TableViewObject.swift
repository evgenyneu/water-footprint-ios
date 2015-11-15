import UIKit

class TableViewObject: NSObject, UITableViewDelegate {
  @IBOutlet weak var tableView: UITableView!
  var dataSource: TableViewDataSource?
  @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint!
  let underKeyboardLayoutConstraint = UnderKeyboardLayoutConstraint()
  
  
  @IBOutlet weak var myHeaderView: UIView!
  
  func setUp() {
    tableView.tableFooterView = UIView(frame: CGRectZero)
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
    tableView.delegate = self
    
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
  
  // MARK: - UITableViewDelegate
  
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("Water footprint table header")
      as? TableViewHaaderCell else { return nil }
    
    cell.setup()
    
    return cell
  }
  
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if tableView.traitCollection.verticalSizeClass == .Compact {
      // Do not show unit header in lanscape on phone
      return 0
    }
    
    return WaterFont.accesibilityFontSizeFactor * 44.0
  }
  
  func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    cell.preservesSuperviewLayoutMargins = false
    cell.layoutMargins = UIEdgeInsetsZero
  }
}