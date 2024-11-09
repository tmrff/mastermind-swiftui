import SwiftUI

struct GameScreen: TestableView {
    @State private var game: Game
    @State private var guess1: CodeChoice?
    @State private var guess: Guess
    var viewInspectorHook: ((Self) -> Void)?
    
    init(game: Game) {
        self.game = game
        game.makeNewSecret()
        guess = Guess(secretSize: game.secretSize)
    }
    
    var body: some View {
        Color.background.ignoresSafeArea().overlay {
            HStack {
                CodeGuessView(guess1: $guess1, guess: $guess)
                CodeChoicesView(game: $game, guess1: $guess1, guess: $guess)
            }
        }
        .inspectableSheet(isPresented: .constant(guess1 != nil)) {
//            if (game.isGuessCorrect([guess1!])) {
            if (game.secret.code[0] == guess1) {
                Text("You win!")
            } else {
                Text("You lose! The secret was \(game.secret.code[0].color)")
            }
        }
        .onAppear { self.viewInspectorHook?(self) }
    }
}

private struct CodeGuessView: View {
    @Binding var guess1: CodeChoice?
    @Binding var guess: Guess
    
    var body: some View {
        Button(action: {}, label: {
            Circle()
                .padding(10)
                .overlay(
                    Circle()
                        .strokeBorder(Color.unselected, lineWidth: 2)
                )
                .foregroundColor(guess[0]?.color ?? Color.unselected)
                .frame(width: 100, height: 100)
        })
        .id("guess1")
    }
}

private struct CodeChoicesView: View {
     @Binding var game: Game
     @Binding var guess1: CodeChoice?
     @Binding var guess: Guess

     var body: some View {
         VStack {
             ForEach(game.codeChoices.lastToFirst, id: \.codeValue) { codeChoice in
                 CodeChoiceView(codePeg: codeChoice, codeChoiceId: codeChoice.codeValue, guess1ToSet: $guess1, guessToSet: $guess)
             }
         }
         .id("codeChoices")
     }
 }

private struct CodeChoiceView: View {
    var codePeg: CodeChoice
    var codeChoiceId: Int
    @Binding var guess1ToSet: CodeChoice?
    @Binding var guessToSet: Guess
    
    var body: some View {
        Button(action: {
            guess1ToSet = codePeg
            guessToSet[0] = codePeg
        }, label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .foregroundColor(codePeg.color)
                        .padding(10)
                )
        })
        .id(codeChoiceId)
    }
}

private extension CodeChoices {
    var lastToFirst: [CodeChoice] {
        return options.reversed()
    }
}

#Preview {
    GameScreen(game: try! Game(numberOfCodeChoices: 2, secretSize: 1, SecretMaker.createNull()))
}
