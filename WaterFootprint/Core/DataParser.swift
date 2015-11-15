import UIKit

struct DataParser {
  
  static private var dataCache: [ProductModel]?
  
  static func readAndParseForCurrentLanguageCached() -> [ProductModel] {
    if let dataCache = dataCache { return dataCache }
    let data = readAndParseForCurrentLanguage()
    dataCache = data
    return data
  }
  
  static func readAndParseForCurrentLanguage() -> [ProductModel] {
    return readAndParse(DataLanguage.supportedLanguage())
  }
  
  static func readAndParse(languageCode: String) -> [ProductModel] {
    let data = DataReader.read(languageCode)
    return parse(data)
  }
  
  static func parse(data: String) -> [ProductModel] {
    let lines = data.componentsSeparatedByString("\r\n")

    return lines.map { line in
      let fields = line.componentsSeparatedByString("\t")
      
      if fields.count != 3 {
        preconditionFailure("Incorrect number of fields in data file: \(String(line)).")
      }
      
      if let waterLitres = Int(fields[2]) {
        return ProductModel(
          name: fields[0],
          synonyms: fields[1],
          waterLitres: waterLitres)
      } else {
        preconditionFailure("Can not convert water litres to integer: \(String(line)).")
      }
    }
  }
}
