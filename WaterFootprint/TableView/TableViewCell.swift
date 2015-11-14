import UIKit

class TableViewCell: UITableViewCell {
  @IBOutlet weak var productLabel: UILabel!
  @IBOutlet weak var waterLitresLabel: UILabel!
  
  func showModel(model: ProductModel) {
    productLabel.text = model.name
    waterLitresLabel.text = formatNumber(model.waterLitres)
  }
  
  func formatNumber(number: Int) -> String {
    return String.localizedStringWithFormat("%i", number)
  }
}
