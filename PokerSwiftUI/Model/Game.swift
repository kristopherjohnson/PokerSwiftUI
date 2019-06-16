enum GameState {
    case newGame
    case newHand
    case afterDraw
    case outOfChips
}

class Game {
    var hand: Hand = Hand(cards: [])
    var deck: Deck = Deck(shuffled: true)
}
