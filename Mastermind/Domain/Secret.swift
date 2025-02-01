struct Secret: CustomStringConvertible {
    let code: [CodeChoice]
    
    var description: String {
        code.map(\.color.description).joined(separator: ", ")
    }
    
    var size: Int {
        code.count
    }
    
    func evaluate(_ guess: Guess) -> Feedback {
        var inCorrectPosition = 0
        var inWrongPosition = 0
        for (index, secret) in code.enumerated() {
            if guess[index] == secret {
                inCorrectPosition += 1
            } else if guess.contains(secret) {
                inWrongPosition += 1
            }
        }
        return Feedback(inCorrectPosition: inCorrectPosition, inWrongPosition: inWrongPosition)
    }
    
    func matches(_ guess: Guess) -> Bool {
        guard code.count == guess.size else {
            return false
        }
        for (index, secret) in code.enumerated() {
            if guess[index] != secret {
                return false
            }
        }
        return true
    }
}
