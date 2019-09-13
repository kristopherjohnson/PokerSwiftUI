import XCTest
@testable import PokerSwiftUI

class PokerSwiftUITests: XCTestCase {

    func testUnshuffledDeck() {
        var deck = Deck(shuffled: false)

        XCTAssertEqual(deck.cards.count, 52,
                       "Must be complete deck of 52 cards")

        XCTAssertEqual(deck.cards[0].description, Card(.ace,.clubs).description)
        XCTAssertEqual(deck.cards[1].description, Card(.two, .clubs).description)

        XCTAssertEqual(deck.cards[50].description, Card(.queen, .spades).description)
        XCTAssertEqual(deck.cards[51].description, Card(.king, .spades).description)
        
        if let firstDrawnCard = deck.drawCard() {
            XCTAssertEqual(firstDrawnCard.description, Card(.king, .spades).description)
        }
        else {
            XCTFail("drawCard failed")
        }
        
        if let secondDrawnCard = deck.drawCard() {
            XCTAssertEqual(secondDrawnCard.description, Card(.queen, .spades).description)
        }
        else {
            XCTFail("drawCard failed")
        }
        
        XCTAssertEqual(deck.cards.count, 50,
                       "Count must be 50 after two cards drawn")
    }
}
