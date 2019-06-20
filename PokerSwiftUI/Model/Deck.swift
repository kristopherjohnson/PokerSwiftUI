/// Deck of cards, usually shuffled, from which cards can be drawn.
struct Deck {
    var cards: [Card]
    
    init(shuffled: Bool) {
        var cards = [Card]()
        cards.reserveCapacity(Suit.allCases.count * Rank.allCases.count)
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(rank, suit))
            }
        }
        if shuffled {
            cards.shuffle()
        }
        self.cards = cards
    }
    
    /// Remove and return the card from the top of the deck.
    ///
    /// Returns `none` if the deck is empty.
    mutating func drawCard() -> Card? {
        cards.popLast()
    }
    
    /// Deal a hand of five cards
    mutating func dealHand() -> Hand {
        assert(cards.count >= 5)
        var handCards = [Card]()
        for _ in 0..<cardsPerHand {
            handCards.append(drawCard()!)
        }
        return Hand(cards: handCards)
    }
}
