@testable import Mastermind
import ViewInspector
import XCTest

extension XCTestCase {
    @MainActor func inspectChangingView<V: TestableView>(
        _ sut: inout V,
        action: @escaping ((InspectableView<ViewType.View<V>>) throws -> Void),
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let expectation = sut.on(\.viewInspectorHook, file: file, line: line, perform: action)
        ViewHosting.host(view: sut)
        wait(for: [expectation], timeout: 0.01)
    }
}
