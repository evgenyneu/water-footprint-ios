import UIKit

class TableViewDelegate: NSObject, UITableViewDelegate {
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