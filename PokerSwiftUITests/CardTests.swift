//
//  CardTests.swift
//  PokerSwiftUITests
//
//  Created by Kristopher Johnson on 6/16/19.
//  Copyright © 2019 Kristopher Johnson. All rights reserved.
//

import XCTest
@testable import PokerSwiftUI

class CardTests: XCTestCase {

    func testCardDescription() {
        XCTAssertEqual(Card(.ace,   .clubs).description,    "Ace of Clubs")
        XCTAssertEqual(Card(.two,   .diamonds).description, "Two of Diamonds")
        XCTAssertEqual(Card(.three, .hearts).description,   "Three of Hearts")
        XCTAssertEqual(Card(.four,  .spades).description,   "Four of Spades")
        XCTAssertEqual(Card(.five,  .clubs).description,    "Five of Clubs")
        XCTAssertEqual(Card(.six,   .diamonds).description, "Six of Diamonds")
        XCTAssertEqual(Card(.seven, .hearts).description,   "Seven of Hearts")
        XCTAssertEqual(Card(.eight, .spades).description,   "Eight of Spades")
        XCTAssertEqual(Card(.nine,  .clubs).description,    "Nine of Clubs")
        XCTAssertEqual(Card(.ten,   .diamonds).description, "Ten of Diamonds")
        XCTAssertEqual(Card(.jack,  .hearts).description,   "Jack of Hearts")
        XCTAssertEqual(Card(.queen, .spades).description,   "Queen of Spades")
        XCTAssertEqual(Card(.king,  .clubs).description,    "King of Clubs")
    }
}
