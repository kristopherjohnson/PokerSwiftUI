import XCTest
@testable import PokerSwiftUI

class ScoreTests: XCTestCase {

    func testLoss() {
        let cards = [
            Card(.two,   .clubs),
            Card(.three, .clubs),
            Card(.four,  .clubs),
            Card(.ten,   .diamonds),
            Card(.jack,  .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .loss)
    }

    func testJacksOrBetter() {
        let cards = [
            Card(.two,   .clubs),
            Card(.jack,  .diamonds),
            Card(.three, .clubs),
            Card(.four,  .clubs),
            Card(.jack,  .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .jacksOrBetter)
    }

    func testLowPair() {
        let cards = [
            Card(.two,  .clubs),
            Card(.jack, .diamonds),
            Card(.two,  .clubs),
            Card(.four, .clubs),
            Card(.king, .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .loss)
    }
    
    func testTwoPair() {
        let cards = [
            Card(.two,  .clubs),
            Card(.king, .diamonds),
            Card(.two,  .clubs),
            Card(.four, .clubs),
            Card(.king, .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .twoPair)
    }
    
    func testThreeOfAKind() {
        let cards = [
            Card(.two,  .clubs),
            Card(.king, .diamonds),
            Card(.two,  .clubs),
            Card(.four, .clubs),
            Card(.two,  .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .threeOfAKind)
    }
    
    func testStraight() {
        let cards = [
            Card(.three, .clubs),
            Card(.six,   .hearts),
            Card(.five,  .hearts),
            Card(.four,  .diamonds),
            Card(.seven, .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .straight)
    }
    
    func testFlush() {
        let cards = [
            Card(.two,   .hearts),
            Card(.king,  .hearts),
            Card(.eight, .hearts),
            Card(.four,  .hearts),
            Card(.nine,  .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .flush)
    }
    
    func testFullHouse() {
        let cards = [
            Card(.two,   .hearts),
            Card(.queen, .hearts),
            Card(.two,   .clubs),
            Card(.two,   .spades),
            Card(.queen, .diamonds),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .fullHouse)
    }
    
    func testFourOfAKind() {
        let cards = [
            Card(.two,   .hearts),
            Card(.two,   .diamonds),
            Card(.two,   .clubs),
            Card(.two,   .spades),
            Card(.queen, .diamonds),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .fourOfAKind)
    }

    func testStraightFlush() {
        let cards = [
            Card(.ace,   .hearts),
            Card(.five,  .hearts),
            Card(.three, .hearts),
            Card(.four,  .hearts),
            Card(.two,   .hearts),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .straightFlush)
    }

    func testRoyalFlush() {
        let cards = [
            Card(.ace,   .spades),
            Card(.king,  .spades),
            Card(.jack,  .spades),
            Card(.ten,   .spades),
            Card(.queen, .spades),
        ]
        let hand = Hand(cards: cards)
        XCTAssertEqual(hand.score, .royalFlush)
    }
}
