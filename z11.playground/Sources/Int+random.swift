// Ole Begeman offers here https://oleb.net/blog/2016/09/swift-3-ranges/ (bottom of the page)
// and here https://oleb.net/blog/2016/10/generic-range-algorithms/
// an interesting consideration about converting between half-open and closed ranges.
// As of now, it seems the way to go is by overloading...

import Foundation
import Darwin


public func random(from range: Range<Int>) -> Int {
    let lowerBound = range.lowerBound
    let upperBound = range.upperBound
    
    return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound)))
}

public func random(from range: ClosedRange<Int>) -> Int {
    let lowerBound = range.lowerBound
    let upperBound = range.upperBound
    
    return lowerBound + Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1)))
}

// As suggested by Dave Abrahams on swift-users@swift.org mailing list
// https://lists.swift.org/pipermail/swift-users/Week-of-Mon-20161010/003701.html

public protocol CompleteRange {
    associatedtype Bound : Comparable
    var lowerBound : Bound { get }
    var upperBound : Bound { get }
}

extension CountableRange : CompleteRange {}
extension CountableClosedRange : CompleteRange {}


public func random<R: CompleteRange>(from range: R) -> Int where R.Bound == Int, R: Collection {
    return range.lowerBound + Int(arc4random_uniform(numericCast(range.count)))
}
