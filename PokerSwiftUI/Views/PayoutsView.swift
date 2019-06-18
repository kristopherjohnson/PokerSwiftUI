import SwiftUI

/// Displays a table of payouts for winning hands.
struct PayoutsView : View {
    var body: some View {
        VStack {
            Text("Payouts")
                .fontWeight(.bold)
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
            .frame(width: 270)
            .allowsTightening(true)
        }
        .font(Font.custom("Futura", size: 13))
    }
}

struct PayoutLine : View {
    let score: Score
    
    var body: some View {
        return HStack {
            Text(score.description)
            Spacer()
            Text(score.payout.description)
                .layoutPriority(1)
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
