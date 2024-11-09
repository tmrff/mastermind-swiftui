import SwiftUI

@main
struct MastermindApp: App {
    var body: some Scene {
        WindowGroup {
            GameScreen(game: try! Game(numberOfCodeChoices: 2, secretSize: 1, SecretMaker()))
        }
    }
}
