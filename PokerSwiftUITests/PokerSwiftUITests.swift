//
//  PokerSwiftUITests.swift
//  PokerSwiftUITests
//
//  Created by Kristopher Johnson on 6/13/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

import XCTest
@testable import PokerSwiftUI

class PokerSwiftUITests: XCTestCase {

    func testUnshuffledDeck() {
        var deck = Deck(shuffled: false)

        XCTAssertEqual(deck.cards.count, 52)

        XCTAssertEqual(deck.cards[0], Card(.ace,.clubs))
        XCTAssertEqual(deck.cards[1], Card(.two, .clubs))

        XCTAssertEqual(deck.cards[50], Card(.queen, .spades))
        XCTAssertEqual(deck.cards[51], Card(.king, .spades))
        
        if let firstDrawnCard = deck.drawCard() {
            XCTAssertEqual(firstDrawnCard, Card(.king, .spades))
        }
        else {
            XCTFail("drawCard failed")
        }
        
        if let secondDrawnCard = deck.drawCard() {
            XCTAssertEqual(secondDrawnCard, Card(.queen, .spades))
        }
        else {
            XCTFail("drawCard failed")
        }
    }
}
