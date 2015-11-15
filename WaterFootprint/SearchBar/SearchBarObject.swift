import UIKit

class SearchBarObject: NSObject {
  @IBOutlet weak var searchBar: UISearchBar!
 
  func setUp() {
    guard let textField = searchBar.valueForKey("searchField") as? UITextField else { return }
    textField.textColor = UIColor.whiteColor()
    textField.backgroundColor = UIColor.blackColor()
  }
}