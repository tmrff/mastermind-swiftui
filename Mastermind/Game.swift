import SwiftUI

final class Game {
    let codeChoices: CodeChoices
    var secret = Secret(code: [])
    
    init(numberOfCodeChoices: Int, _ secretMaker: SecretMaker) throws {
        try codeChoices = CodeChoiceGenerator.generate(from: codeColors, take: numberOfCodeChoices)
    }
    
    func codeChoice(_ index: Int) -> CodeChoice {
        return codeChoices.options[index]
    }
    
    func codeChoiceColor(_ index: Int) -> Color {
        return codeChoice(index).color
    }
    
    func isGuessCorrect(_ guess: [CodeChoice]) -> Bool {
        return secret.code == guess
    }
}
