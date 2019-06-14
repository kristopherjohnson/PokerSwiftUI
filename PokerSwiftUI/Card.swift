//
//  Card.swift
//  PokerSwiftUI
//
//  Created by Kristopher Johnson on 6/13/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

import Foundation

enum Suit : CaseIterable {
    case clubs
    case diamonds
    case hearts
    case spades
}

enum Rank : CaseIterable {
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
}

struct Card {
    let rank: Rank
    let suit: Suit
    let id: UUID
    
    init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.id = UUID()
    }
}
