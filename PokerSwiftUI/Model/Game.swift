enum GameState {
    case newGame
    case afterDeal
    case afterDraw
    case outOfCredits
}

class Game {
    var hand: Hand = Hand(cards: [])
    var deck: Deck = Deck(shuffled: true)
}
