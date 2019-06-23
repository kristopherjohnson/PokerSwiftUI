import SwiftUI

extension Card : Identifiable {}

/// Main view for the app.
struct ContentView : View {
    @ObjectBinding var model = Game()
    
    var body: some View {
        VStack {
            Spacer()
            
            PayoutsView()
                .padding()
                .background(payoutsBackgroundColor,
                            cornerRadius: 20)
            
            if model.state != .newGame {
                HStack {
                    Text("Credits Remaining:")
                    Text(model.creditsRemaining.description)
                        .color(creditsRemainingColor)
                        .bold()
                }
                .padding(.top)
            }
            
            HStack {
                Spacer()
                if model.state == .newGame {
                    Text("Jacks or Better Poker")
                        .font(.largeTitle)
                        .color(.yellow)
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
                                            .offset(y: 3)
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
                Spacer()
            }
            .padding()

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
            }
            .frame(width: 130)
            .padding()
            .background(actionButtonColor,
                        cornerRadius: 8)
            
            Spacer()
        }
        .background(viewBackgroundColor)
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
                    .color(suitColor)
                    .font(Font.system(size: 30))
                    .bold()
                Spacer()
            }
            HStack {
                Spacer()
                Text(card.suit.symbol)
                    .color(suitColor)
                    .font(Font.system(size: 36))
            }
        }
        .padding(.all, 4)
        .frame(width: 56)
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

struct HoldMarker : View {
    let color: Color
    var body: some View {
        Text("HOLD")
            .color(color)
            .font(Font.custom("Futura-CondensedExtraBold", size: 20))
            .rotationEffect(Angle(degrees: -35))
            .scaleEffect(Length(1.6))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}
#endif
