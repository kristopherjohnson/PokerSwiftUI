import SwiftUI

/// Displays a table of payouts for winning hands.
struct PayoutsView : View {
    var body: some View {
        return VStack {
            Text("Jacks-or-Better Payouts")
                .font(.subheadline)
                .padding(.bottom, 4)
            HStack {
                VStack {
                    PayoutLine(score: .royalFlush)
                    PayoutLine(score: .straightFlush)
                    PayoutLine(score: .fourOfAKind)
                    PayoutLine(score: .fullHouse)
                    PayoutLine(score: .flush)
                }
                VStack {
                    PayoutLine(score: .straight)
                    PayoutLine(score: .threeOfAKind)
                    PayoutLine(score: .twoPair)
                    PayoutLine(score: .jacksOrBetter)
                    Text(" ") // TODO: Is there a better way to line everything up?
                }
            }
            .frame(width: 270)
            .font(.caption)
            .allowsTightening(true)
        }
    }
}

struct PayoutLine : View {
    let score: Score
    let chipsBet = 5
    
    var body: some View {
        return HStack {
            Text(score.description)
            Spacer()
            Text((score.payout * chipsBet).description)
        }
    }
}

#if DEBUG
struct PayoutsView_Previews : PreviewProvider {
    static var previews: some View {
        PayoutsView()
    }
}
#endif
