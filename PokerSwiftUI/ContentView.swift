//
//  ContentView.swift
//  PokerSwiftUI
//
//  Created by Kristopher Johnson on 6/13/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

import SwiftUI

extension Card : Identifiable {}

struct ContentView : View {
    @State var chipsRemaining: Int = 100
    
    @State var cards: [Card] = [
        Card(.ace,   .hearts),
        Card(.ten,   .clubs),
        Card(.jack,  .diamonds),
        Card(.queen, .spades),
        Card(.king,  .hearts),
    ]
    
    @State var scoreLine = "Royal Straight"
    
    @State var instructionsLine1 =
        "Tap the cards you want to hold."
    @State var instructionsLine2 =
        "Then tap the Draw button."
    
    @State var buttonTitle = "Draw"
    
    var body: some View {
        VStack {
            Spacer()
            
            PayoutsView()
                .padding()
                .background(Color(red: 0.0, green: 0.3, blue: 0.0),
                            cornerRadius: 20)
            
            HStack {
                Text("Chips Remaining:")
                Text(chipsRemaining.description)
                    .color(.yellow)
                    .fontWeight(.bold)
            }
            .padding(.top)
            
            HStack {
                Spacer()
                HStack(spacing: 8) {
                    ForEach(cards) { card in
                        VStack {
                            Button(action: {
                                self.onTap(card: card)
                            }) {
                                CardView(card: card)
                                Text("HOLD")
                                    .fontWeight(.bold)
                                    .color(.yellow)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            VStack {
                Text(scoreLine)
                    .font(.headline)
                    .padding(.bottom)
                Text(instructionsLine1)
                Text(instructionsLine2)
            }
            .padding(.bottom)
            
            Button(action: onTapActionButton) {
                Text(buttonTitle)
                    .font(.largeTitle)
            }
            .padding()
            .background(Color.green, cornerRadius: 8)
            
            Spacer()
        }
        .background(Color(red: 0.0, green: 0.4, blue: 0.0))
        .foregroundColor(Color.white)
        .accentColor(.green)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func onTap(card: Card) {
        // TODO
    }
    
    private func onTapActionButton() {
        // TODO
    }
}

struct CardView : View {
    let card: Card
    
    var body: some View {
        VStack {
            HStack {
                Text(card.rank.symbol)
                    .color(suitColor)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Spacer()
                Text(card.suit.symbol)
                    .color(suitColor)
                    .font(.largeTitle)
            }
        }
        .padding(.all, 4)
        .frame(width: 54)
        .background(Color.white, cornerRadius: 4)
    }
    
    private var suitColor: Color {
        switch card.suit {
        case .diamonds, .hearts:
            return .red
        default:
            return .black
        }
    }
}

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
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        let cards: [Card] = [
            Card(.ace,   .hearts),
            Card(.ten,   .clubs),
            Card(.jack,  .diamonds),
            Card(.queen, .spades),
            Card(.king,  .hearts),
        ]
        return ContentView(chipsRemaining: 100,
                           cards: cards)
    }
}
#endif
