import UIKit

class TableViewObject: NSObject {
  @IBOutlet weak var tableView: UITableView!
  var dataSource: TableViewDataSource?
 
  func setUp() {
    tableView.tableFooterView = UIView(frame: CGRectZero)
  }
  
  func showData(models: [ProductModel]) {
    dataSource = TableViewDataSource(models: models)
    tableView.dataSource = dataSource
  }
}