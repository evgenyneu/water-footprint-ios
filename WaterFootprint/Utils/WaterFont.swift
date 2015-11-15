import UIKit

struct WaterFont {
  
  /// Returns the size of the fynamic font style
  static func preferredFontSize(textStyle: String) -> CGFloat {
    return UIFontDescriptor.preferredFontDescriptorWithTextStyle(textStyle).pointSize
  }
  
  /// Returns the factor of font size. Returns 1 if sizes are normal and
  /// larger than 1 if font sizes are increase in accessibility settings.
  static var accesibilityFontSizeFactor: CGFloat {
    return WaterFont.preferredFontSize(UIFontTextStyleBody) / 17.0
  }
}