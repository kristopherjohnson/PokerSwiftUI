//
//  ContentView.swift
//  PokerSwiftUI
//
//  Created by Kristopher Johnson on 9/12/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = Game()
    
    var body: some View {
        ZStack {
            viewBackgroundColor

            VStack {

                PayoutsView()
                    .padding()
                    .background(payoutsBackgroundColor)
                    .cornerRadius(20)

                if model.state != .newGame {
                    HStack {
                        Text("Credits Remaining:")
                        Text(model.creditsRemaining.description)
                            .foregroundColor(creditsRemainingColor)
                            .bold()
                    }
                    .padding(.top)
                }

                HStack {
                    if model.state == .newGame {
                        Text(verbatim: "Jacks or Better Poker")
                            .font(.largeTitle)
                            .foregroundColor(.yellow)
                            .padding(.top)
                    }
                    else {
                        HStack(spacing: 7) {
                            ForEach(model.hand.cards) { card in
                                Button(action: {
                                    withAnimation {
                                        self.model.onTap(card: card)
                                    }
                                }) {
                                    ZStack {
                                        CardView(card: card)

                                        if self.model.heldCards.contains(card) {
                                            HoldMarker(color: self.holdMarkerShadowColor)
                                                .opacity(self.holdOpacity * 0.7)
                                            HoldMarker(color: self.holdMarkerColor)
                                                .opacity(self.holdOpacity)
                                        }
                                    }
                                }
                                .disabled(!self.model.isTapCardEnabled)
                            }
                        }
                    }
                }

                VStack {
                    Text(model.scoreLine)
                        .font(.headline)
                        .padding(.bottom)
                    Text(model.instructionsTopLine)
                    Text(model.instructionsBottomLine)
                }
                .padding(.bottom)

                Button(action: {
                    withAnimation {
                        self.model.onTapActionButton()
                    }
                }) {
                    Text(model.actionButtonTitle)
                        .font(.largeTitle)
                        .padding()
                        .frame(width: 130)
                        .background(actionButtonColor)
                        .cornerRadius(8)
                }
            }
        }
        .foregroundColor(viewForegroundColor)
        .accentColor(viewAccentColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    private var viewBackgroundColor: Color {
        Color(red: 0.0, green: 0.35, blue: 0.35)
    }
    
    private var viewForegroundColor: Color {
        Color.white
    }
    
    private var viewAccentColor: Color {
        Color.green
    }
    
    private var actionButtonColor: Color {
        Color(red:0, green:0.7, blue:0.7)
    }
    
    private var holdMarkerColor: Color {
        Color.yellow
    }
    
    private var holdMarkerShadowColor: Color {
        Color(white: 0.0, opacity: 0.75)
    }
    
    private var payoutsBackgroundColor: Color {
        Color(red: 0.0, green: 0.3, blue: 0.3)
    }
    
    private var creditsRemainingColor: Color {
        Color.yellow
    }
    
    private var holdOpacity: Double {
        self.model.state == .afterDeal ? 1.0 : 0.3
    }
}

/// Displays a card's rank and suit in a card-shaped rounded rectangle.
struct CardView : View {
    let card: Card
    
    var body: some View {
        VStack {
            HStack {
                Text(card.rank.symbol)
                    .foregroundColor(suitColor)
                    .font(Font.system(size: 30))
                    .bold()
                Spacer()
            }
            HStack {
                Spacer()
                Text(card.suit.symbol)
                    .foregroundColor(suitColor)
                    .font(Font.system(size: 36))
            }
        }
        .padding(.all, 6)
        .frame(width: 56)
        .background(Color.white)
        .cornerRadius(6)
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

struct HoldMarker : View {
    let color: Color
    var body: some View {
        Text("HOLD")
            .foregroundColor(color)
            .font(Font.custom("Futura-CondensedExtraBold", size: 20))
            .rotationEffect(Angle(degrees: -35))
            .scaleEffect(1.6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var newGameModel = Game()
    static var afterDealModel: Game = {
        var game = Game()
        game.onTapActionButton()
        return game
    }()
    static var previews: some View {
        Group {
            ContentView(model: newGameModel)
            ContentView(model: afterDealModel)
        }
    }
}
