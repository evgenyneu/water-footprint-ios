import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
  let models: [ProductModel]
  
  init(models: [ProductModel]) {
    self.models = models

    super.init()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier(WaterConstants.table.cellId)
      as? TableViewCell
      else { return UITableViewCell() }
        
    if let model = modelAtRow(indexPath.row) {
      cell.showModel(model)
    }
    
    return cell
  }
  
  func modelAtRow(rowIndex: Int) -> ProductModel? {
    return WaterArray.getByIndexSafe(rowIndex, array: models)
  }
}