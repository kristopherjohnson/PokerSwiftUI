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
    @State var chipsRemaining = 100
    
    @State var cards: [Card] = [
        Card(.ace,   .hearts),
        Card(.ten,   .clubs),
        Card(.jack,  .diamonds),
        Card(.queen, .spades),
        Card(.king,  .hearts),
    ]
    
    @State var score = "Royal Straight"
    
    @State var instructionsLine1 =
        "Tap the cards you want to hold"
    @State var instructionsLine2 =
        "Then tap the Draw button"
    
    @State var buttonTitle = "Draw"
    
    var body: some View {
        VStack {
            Text("Chips Remaining: \(chipsRemaining)")
                .padding()
            
            HStack {
                Spacer()
                HStack(spacing: 8) {
                    ForEach(cards) { card in
                        VStack {
                            Button(action: {}) {
                                CardView(card: card)
                            }
                            Text("HOLD")
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            Text(score)
                .font(.headline)
                .padding()
            
            Text(instructionsLine1)
                .padding(.bottom)
            Text(instructionsLine2)
                .padding(.bottom)
            
            Button(action: {}) {
                Text(buttonTitle)
                    .font(.largeTitle)
            }
        }
    }
}

struct CardView : View {
    let card: Card
    
    var body: some View {
        VStack {
            HStack {
                Text(rankSymbol)
                    .color(suitColor)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Spacer()
                Text(suitSymbol)
                    .color(suitColor)
                    .font(.largeTitle)
            }
            }
            .padding(.all, 4)
            .frame(width: 72)
            .background(Color.white, cornerRadius: 4)
    }

    private var rankSymbol: String {
        switch card.rank {
        case .ace:   return "A"
        case .two:   return "2"
        case .three: return "3"
        case .four:  return "4"
        case .five:  return "5"
        case .six:   return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine:  return "9"
        case .ten:   return "10"
        case .jack:  return "J"
        case .queen: return "Q"
        case .king:  return "K"
        }
    }

    private var suitSymbol: String {
        switch card.suit {
        case .clubs:    return "♣︎"
        case .diamonds: return "♦︎"
        case .hearts:   return "♥︎"
        case .spades:   return "♠︎"
        }
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

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
