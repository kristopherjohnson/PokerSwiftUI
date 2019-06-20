import SwiftUI

extension Card : Identifiable {}

struct ContentView : View {
    @ObjectBinding var model = Game()
    
    var body: some View {
        VStack {
            Spacer()
            
            PayoutsView()
                .padding()
                .background(Color(red: 0.0, green: 0.3, blue: 0.3),
                            cornerRadius: 20)
            
            HStack {
                Text("Credits Remaining:")
                Text(model.creditsRemaining.description)
                    .color(.yellow)
                    .fontWeight(.bold)
            }
            .padding(.top)
            
            HStack {
                Spacer()
                HStack(spacing: 7) {
                    ForEach(model.hand.cards) { card in
                        VStack {
                            Button(action: {
                                withAnimation {
                                    self.model.onTap(card: card)
                                }
                            }) {
                                CardView(card: card)
                                Text(self.model.heldCards.contains(card) ? "HOLD" : " ")
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
            .background(Color.green,
                        cornerRadius: 8)
            
            Spacer()
        }
        .background(Color(red: 0.0, green: 0.35, blue: 0.35))
        .foregroundColor(Color.white)
        .accentColor(.green)
        .edgesIgnoringSafeArea(.all)
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
                    .fontWeight(.bold)
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

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}
#endif
