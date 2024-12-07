import SwiftUI

@MainActor
protocol ViewInspectorHook {
    var viewInspectorHook: ((Self) -> Void)? { get set }
}

typealias TestableView = View & ViewInspectorHook
