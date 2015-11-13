import Foundation

///
///  Helper functions to work with arrays.
///
public struct WaterArray {
  public static func getByIndexSafe<T>(index: Int, array: [T]) -> T? {
    if index < 0 || index >= array.count { return nil }
    return array[index]
  }
}
