import SwiftUI

struct FeedbackView: View {
    let feedbackPegs: [FeedbackPeg]
    
    func feedbackColor(for peg: FeedbackPeg) -> Color {
        switch peg {
        case .empty:
            return Color.Pegs.unselected
        case .correct:
            return .Pegs.correct
        case .misplaced:
            return .orange
        }
    }
    
    var body: some View {
        Grid {
            GridRow {
                Circle()
                    .foregroundColor(feedbackColor(for: feedbackPegs[0]))
                    .frame(width: 10, height: 10)
                    .accessibilityIdentifier("feedback1")
                Circle()
                    .foregroundColor(Color.Pegs.unselected)
                    .foregroundColor(feedbackColor(for: feedbackPegs[0]))
                    .frame(width: 10, height: 10)
                    .accessibilityIdentifier("feedback2")
            }
            GridRow {
                Circle()
                    .foregroundColor(Color.Pegs.unselected)
                    .foregroundColor(feedbackColor(for: feedbackPegs[0]))
                    .frame(width: 10, height: 10)
                    .accessibilityIdentifier("feedback3")
                Circle()
                    .foregroundColor(Color.Pegs.unselected)
                    .foregroundColor(feedbackColor(for: feedbackPegs[0]))
                    .frame(width: 10, height: 10)
                    .accessibilityIdentifier("feedback4")
            }
        }
    }
}
