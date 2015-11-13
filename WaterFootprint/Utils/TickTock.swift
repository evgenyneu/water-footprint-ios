//
//  Measures code execution time.
//
//  Usage:
//
//    let tick = TickTock()
//    ... code to measure execution time for
//    tick.formattedWithMs()
//
//    Output: [TOCK] 10.2 ms
//

import Foundation

public class TickTock {
  var startTime:NSDate
  
  public init() {
    startTime = NSDate()
  }
  
  func measure() -> Double {
    return Double(Int(-startTime.timeIntervalSinceNow * 10000)) / 10
  }
  
  func formatted() -> String {
    let elapsedMs = measure()
    return String(format: "%.1f", elapsedMs)
  }
  
  func formattedWithMs() -> String {
    return "[TOCK] \(formatted()) ms"
  }
  
  public func output() {
    print(formattedWithMs())
  }
}

