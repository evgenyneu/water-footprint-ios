import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var searchBar: UISearchBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    styleSearchField()
  }
  
  private func styleSearchField() {
    guard let textField = searchBar.valueForKey("searchField") as? UITextField else { return }
    textField.textColor = UIColor.whiteColor()
    textField.backgroundColor = UIColor.blackColor()
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
}

