@testable import Mastermind
import ViewInspector
import XCTest

@MainActor
final class FeedbackViewTests: XCTestCase, Sendable {
    
}

private extension InspectableView {
    func peg1() throws -> InspectableView<ViewType.Shape> {
        try find(viewWithAccessibilityIdentifier: "feedback1").shape()
    }
}
