import UIKit

class ViewController: UIViewController {
  @IBOutlet var tableViewObject: TableViewObject!
  @IBOutlet var searchBarObject: SearchBarObject!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    searchBarObject.setUp()
    tableViewObject.setUp()
    showData()
    searchBarObject.didSearch = didSearch
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
  
  private func didSearch(searchText: String) {
    var data = DataParser.readAndParseForCurrentLanguage()
    
    if !WaterString.blank(searchText) {
      data = DataSearch.dataMatchingSentence(data, sentence: searchText)
    }

    tableViewObject.showData(data)
    tableViewObject.tableView.reloadData()
  }
}

