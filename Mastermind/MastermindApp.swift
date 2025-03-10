import SwiftUI

@main
struct MastermindApp: App {
    var body: some Scene {
        WindowGroup {
            GameScreen(game: try! Game(numberOfCodeChoices: 4, secretSize: 4, SecretMaker()))
        }
    }
}
