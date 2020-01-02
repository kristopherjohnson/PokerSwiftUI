import SwiftUI

/// Displays a table of payouts for winning hands.
struct PayoutsView : View {
    var body: some View {
        VStack {
            Text("Payouts for 5-Credit Bet")
                .padding(.bottom, 4)

            HStack(alignment: .top) {
                VStack {
                    PayoutLine(score: .royalFlush)
                    PayoutLine(score: .straightFlush)
                    PayoutLine(score: .fourOfAKind)
                    PayoutLine(score: .fullHouse)
                    PayoutLine(score: .flush)
                }
                .padding([.trailing], 3)
                VStack {
                    PayoutLine(score: .straight)
                    PayoutLine(score: .threeOfAKind)
                    PayoutLine(score: .twoPair)
                    PayoutLine(score: .jacksOrBetter)
                }
                .padding([.leading], 3)
            }
            .frame(width: 280)
        }
        .font(PayoutsView.font)
        .allowsTightening(true)
    }

    static var font = Font.custom("Futura", size: 13)
}

struct PayoutLine : View {
    let score: Score
    
    var body: some View {
        return HStack {
            Text(score.payoutTableDescription)
            Spacer()
            Text(score.payout.description)
                .layoutPriority(1)
        }
    }
}

extension Score {
    var payoutTableDescription: String {
        self == .jacksOrBetter ? "Jacks or Better" : self.description
    }
}

#if DEBUG
struct PayoutsView_Previews : PreviewProvider {
    static var previews: some View {
        PayoutsView()
    }
}
#endif
