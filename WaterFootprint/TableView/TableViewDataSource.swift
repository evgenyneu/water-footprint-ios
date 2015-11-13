import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
  let models: [ProductModel]
  
  init(models: [ProductModel]) {
    self.models = models

    super.init()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
