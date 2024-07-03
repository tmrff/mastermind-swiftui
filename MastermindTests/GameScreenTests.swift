import XCTest
import ViewInspector
import SwiftUI
@testable import ViewInspector
@testable import Mastermind

final class GameScreenTests: XCTestCase {
    
    private func display(
        _ sut: inout GameScreen,
        using: @escaping ((InspectableView<ViewType.View<GameScreen>>) throws -> Void),
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let expectation = sut.on(\.viewInspectorHook, file: file, line: line, perform: using)
        ViewHosting.host(view: sut)
        wait(for: [expectation], timeout: 0.01)
    }
    
    private func getColorOfGuess<V: ViewInspector.KnownViewType>(_ view: InspectableView<V>) throws -> Color? {
        try view.asInspectableView().vStack()[0].button().labelView().shape().foregroundColor()
    }
    
    func test_tappingCircleTurnsItOrange() throws {
        var sut = GameScreen()
        var color = try getColorOfGuess(try sut.inspect())
        XCTAssertNotEqual(color, Color.orange, "Precondition")
        
        display(&sut) { view in
            try view.vStack()[0].button().tap()
            color = try self.getColorOfGuess(view)
        }
        XCTAssertEqual(color, Color.orange)
    }
}
