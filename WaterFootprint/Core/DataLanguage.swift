import UIKit

struct DataLanguage {
  
  static let defaultLanguageCode = "en"
  static let supportedLanguageCodes = [defaultLanguageCode, "zh", "ja", "ru"]
  
  /*

  Contains ISO language for the current language that is used to choose localized version
  of the data file. This can be overriden in unit tests.

  */
  static var _currentLanguageCode: String?
  
  // Returns ISO language code that is used for choosing the version of the localized data file.
  static func supportedLanguage() -> String {
    if let currentLanguageCode = _currentLanguageCode {
      return currentLanguageCode
    }
    
    let language = supportedLanguage(NSLocale.preferredLanguages())
    _currentLanguageCode = language
    return language
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