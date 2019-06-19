import Combine
import SwiftUI

enum GameState {
    case newGame
    case afterDeal
    case afterDraw
    case outOfCredits
}

/// Cards displayed before a game starts.
private let attractModeCards: [Card] = [
    Card(.ace, .hearts),
    Card(.king, .hearts),
    Card(.queen, .hearts),
    Card(.jack, .hearts),
    Card(.ten, .hearts),
]

class Game: BindableObject {
    
    var didChange = PassthroughSubject<Game, Never>()
    
    var creditsRemaining = 100
    
    var hand: Hand = Hand(cards: attractModeCards)
    var deck: Deck = Deck(shuffled: true)
}
