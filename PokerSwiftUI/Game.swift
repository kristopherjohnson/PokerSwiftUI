//
//  Game.swift
//  PokerSwiftUI
//
//  Created by Kristopher Johnson on 6/15/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

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
