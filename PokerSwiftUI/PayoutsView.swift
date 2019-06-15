//
//  PayoutsView.swift
//  PokerSwiftUI
//
//  Created by Kristopher Johnson on 6/15/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

import SwiftUI

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
                    Text(" ")
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
    
    var body: some View {
        return HStack {
            Text(score.description)
            Spacer()
            Text((score.payout * 5).description)
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
