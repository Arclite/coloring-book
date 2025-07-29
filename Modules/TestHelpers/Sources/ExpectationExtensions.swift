import Testing
import XCTest

import TestHelpersInterface

extension XCTestExpectation: TestHelpersInterface.Expectation {}

extension Confirmation: TestHelpersInterface.Expectation {
    public func fulfill() { confirm() }
}
