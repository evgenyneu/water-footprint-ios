import UIKit

class SearchBarObject: NSObject, UISearchBarDelegate {
  @IBOutlet weak var searchBar: UISearchBar!
  var didSearch: ((String)->())?
 
  func setUp() {
    searchBar.delegate = self
    guard let textField = searchBar.valueForKey("searchField") as? UITextField else { return }
    textField.textColor = UIColor.whiteColor()
    textField.backgroundColor = UIColor.blackColor()
  }
  
  // MARK: - UISearchBarDelegate
  
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    guard let searchText = searchBar.text else { return }
    didSearch?(searchText)
  }
}