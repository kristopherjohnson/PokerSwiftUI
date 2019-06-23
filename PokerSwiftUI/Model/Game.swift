import Combine
import SwiftUI

/// Cards displayed before a game starts.
private let attractModeCards: [Card] = [
    Card(.ace, .hearts),
    Card(.king, .hearts),
    Card(.queen, .hearts),
    Card(.jack, .hearts),
    Card(.ten, .hearts),
]

/// The model for the state of the poker game.
class Game: BindableObject {
    
    enum GameState {
        case newGame
        case afterDeal
        case afterDraw
        case outOfCredits
    }
    
    private(set) var didChange = PassthroughSubject<Game, Never>()
    
    private(set) var state: GameState
    private(set) var creditsRemaining: Int
    private(set) var hand: Hand
    private(set) var heldCards: Set<Card>
    private(set) var deck: Deck
    
    /// Text displayed below the cards.
    var scoreLine: String {
        if state == .newGame {
            return " "
        }
        
        let score = hand.score
        switch score {
        case .loss:
            return " "
        default:
            return score.description
        }
    }
    
    /// Top line of instructions displayed above the button
    var instructionsTopLine: String {
        switch state {
        case .newGame:
            return "Welcome to Jacks or Better poker"
        case .afterDeal:
            return "Tap the cards you want to hold"
        case .afterDraw:
            let score = hand.score
            switch score {
            case .loss:
                return "You lost this hand"
            default:
                return "You won \(score.payout) credits!"
            }
        case .outOfCredits:
            return "You are out of credits"
        }
    }
    
    /// Bottom line of instructions displayed above the button
    var instructionsBottomLine: String {
        switch state {
        case .newGame:
            return "Tap the Deal button to begin"
        case .afterDeal:
            return "Then tap the Draw button"
        case .afterDraw:
            return "Tap Deal to bet on a new hand"
        case .outOfCredits:
            return "Tap New Game to start over"
        }
    }
    
    /// Title of the big button
    var actionButtonTitle: String {
        switch state {
        case .newGame:
            return "Deal"
        case .afterDeal:
            return "Draw"
        case .afterDraw:
            return "Deal"
        case .outOfCredits:
            return "New Game"
        }
    }
    
    /// `true` if tapping card to select is enabled
    var isTapCardEnabled: Bool {
        state == .afterDeal
    }
    
    init() {
        state = .newGame
        creditsRemaining = 100
        hand = Hand(cards: attractModeCards)
        deck = Deck(shuffled: false)
        heldCards = []
    }
    
    func onTap(card: Card) {
        if state == .afterDeal {
            if heldCards.contains(card) {
                heldCards.remove(card)
            }
            else {
                heldCards.insert(card)
            }
            
            didChange.send(self)
        }
    }
    
    func onTapActionButton() {
        switch state {
        case .newGame, .afterDraw:
            deal()
        case .afterDeal:
            draw()
        case .outOfCredits:
            newGame()
        }
        
        didChange.send(self)
    }

    private func newGame() {
        state = .newGame
        creditsRemaining = 100
        hand = Hand(cards: attractModeCards)
    }
    
    private func deal() {
        state = .afterDeal
        creditsRemaining -= creditsPerBet
        deck = Deck(shuffled: true)
        hand = deck.dealHand()
        heldCards = []
    }
    
    private func draw() {
        var cardsAfterDraw = [Card]()
        cardsAfterDraw.reserveCapacity(cardsPerHand)
        for i in 0..<cardsPerHand {
            if heldCards.contains(hand.cards[i]) {
                cardsAfterDraw.append(hand.cards[i])
            }
            else {
                cardsAfterDraw.append(deck.drawCard()!)
            }
        }
        hand = Hand(cards: cardsAfterDraw)

        creditsRemaining += hand.score.payout
        state = (creditsRemaining == 0) ? .outOfCredits : .afterDraw        
    }
}
