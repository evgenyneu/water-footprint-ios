import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet var tableViewObject: TableViewObject!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    styleSearchField()
    tableViewObject.setUp()
  }
  
  private func styleSearchField() {
    guard let textField = searchBar.valueForKey("searchField") as? UITextField else { return }
    textField.textColor = UIColor.whiteColor()
    textField.backgroundColor = UIColor.blackColor()
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  
  @IBAction func didTapTableView(sender: AnyObject) {
    searchBar.resignFirstResponder()
  }
}

