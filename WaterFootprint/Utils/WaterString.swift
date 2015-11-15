//
//  Helper functions to work with strings.
//

import Foundation

public struct WaterString {
  public static func contains(text: String, substring: String,
    ignoreCase: Bool = false,
    ignoreDiacritic: Bool = false) -> Bool {
      
    var options = NSStringCompareOptions()
    
    if ignoreCase { options.insert(NSStringCompareOptions.CaseInsensitiveSearch)  }
    if ignoreDiacritic { options.insert(NSStringCompareOptions.DiacriticInsensitiveSearch) }
    
    return text.rangeOfString(substring, options: options) != nil
  }
  
  public static func blank(text: String) -> Bool {
    let trimmed = text.stringByTrimmingCharactersInSet(
      NSCharacterSet.whitespaceAndNewlineCharacterSet())
    
    return trimmed.isEmpty
  }
}
