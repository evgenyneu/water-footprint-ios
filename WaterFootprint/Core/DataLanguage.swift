import UIKit

struct DataLanguage {
  
  static let defaultLanguageCode = "en"
  static let supportedLanguageCodes = [defaultLanguageCode, "zh", "ja"]
  
  /// Returns ISO language code that will be used to show data
  static func supportedLanguage() -> String {
    return supportedLanguage(NSLocale.preferredLanguages())
  }
  
  static func supportedLanguage(preferredLocales: [String]) -> String {
    let preferred_codes = codes(preferredLocales)
    
    for code in preferred_codes {
      if supportedLanguageCodes.contains(code) {
        return code
      }
    }
    
    return defaultLanguageCode
  }
  
  static func codes(preferredLocales: [String]) -> [String] {
    return preferredLocales.map { element in
      let dashSeparated = element.componentsSeparatedByString("-")
      if dashSeparated.count > 1 { return dashSeparated[0].lowercaseString }
      
      let underscoreSeparated = element.componentsSeparatedByString("_")
      if underscoreSeparated.count > 1 { return underscoreSeparated[0].lowercaseString }
      
      return element.lowercaseString
    }
  }
}