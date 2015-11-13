import UIKit

struct DataReader {
  
  static func fileName(languageCode: String) -> String {
    return "data_\(languageCode).tsv"
  }
  
  static func read(languageCode: String) -> String {
    if let filePath = NSBundle.mainBundle().pathForResource(fileName(languageCode), ofType: nil) {
      return try! String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
    } else {
      preconditionFailure("Error loading data file")
    }
  }
}