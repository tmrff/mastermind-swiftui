@testable import Mastermind
import Testing

private let red = CodeChoice(color: .red, codeValue: 1)
private let green = CodeChoice(color: .green, codeValue: 2)
private let blue = CodeChoice(color: .blue, codeValue: 3)

final class FeedbackPegsTests: @unchecked Sendable {
    
    @Test(arguments: [
        (1, [FeedbackPeg.empty]),
        (2, [FeedbackPeg.empty, FeedbackPeg.empty]),
    ])
    func nothingCorrectYet(totalCount: Int, expected: [FeedbackPeg]) async throws {
        let feedback = Feedback(totalCount: totalCount, inCorrectPosition: 0, inWrongPosition: 0)
        
        let feedbackPegs = FeedbackPegs(feedback)
        
        #expect(feedbackPegs.pegs == expected)
    }
}
