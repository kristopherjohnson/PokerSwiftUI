//
//  Card.swift
//  PokerSwiftUI
//
//  Created by Kristopher Johnson on 6/13/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

import Foundation

enum Suit : Int, CaseIterable {
    case clubs
    case diamonds
    case hearts
    case spades

    var symbol: String {
        switch self {
        case .clubs:    return "\u{2663}"
        case .diamonds: return "\u{2666}"
        case .hearts:   return "\u{2665}"
        case .spades:   return "\u{2660}"
        }
    }
}

enum Rank : Int, CaseIterable {
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
    
    var symbol: String {
        switch self {
        case .ace:   return "A"
        case .two:   return "2"
        case .three: return "3"
        case .four:  return "4"
        case .five:  return "5"
        case .six:   return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine:  return "9"
        case .ten:   return "10"
        case .jack:  return "J"
        case .queen: return "Q"
        case .king:  return "K"
        }
    }
}

struct Card: Equatable {
    let rank: Rank
    let suit: Suit
    let id: Int
    
    init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.id = rank.rawValue + 100 * suit.rawValue
    }
    
    var symbol: String {
        "\(rank.symbol)\(suit.symbol)"
    }
}
