import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet var tableViewObject: TableViewObject!
  @IBOutlet var searchBarObject: SearchBarObject!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchBarObject.setUp()
    tableViewObject.setUp()
    showData()
  }
  
  private func showData() {
    let data = DataParser.readAndParseForCurrentLanguage()
    tableViewObject.showData(data)
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  
  @IBAction func didTapTableView(sender: AnyObject) {
    searchBarObject.searchBar.resignFirstResponder()
  }
}

