@testable import Mastermind
import SnapshotTesting
import SwiftUI
import Testing

@MainActor
final class CheckButtonSnapshotTests: @unchecked Sendable {
    @Test
    func disabledColor() async throws {
        let view = makeSUT(true)
        assertSnapshot(of: view.toVC(), as: closeEnough())
    }
    
    @Test
    func enabledColor() async throws {
        let view = makeSUT(false)
        assertSnapshot(of: view.toVC(), as: closeEnough())
    }
    
    private func makeSUT(_ disabled: Bool) -> some View {
        VStack {
            CheckButton().disabled(disabled)
        }
        .frame(width: 50)
    }
    
    private func closeEnough() -> Snapshotting<UIViewController, UIImage> {
        return .image(precision: 0.99)
    }
}

extension SwiftUI.View {
    func toVC() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}
