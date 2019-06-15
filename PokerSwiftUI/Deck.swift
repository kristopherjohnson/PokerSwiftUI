//
//  Deck.swift
//  PokerSwiftUI
//
//  Created by Kristopher Johnson on 6/15/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

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
    
    mutating func drawCard() -> Card? {
        cards.popLast()
    }
}
