let cardsPerHand = 5

/// The player's hand, consisting of five cards.
struct Hand {
    let cards: [Card]
    let score: Score

    init(cards: [Card]) {
        assert(cards.count == cardsPerHand)
        self.cards = cards
        self.score = handScore(cards: cards)
    }
}

private typealias RankCounts = [Rank : Int]
private typealias SuitCounts = [Suit : Int]

private func handScore(cards: [Card]) -> Score {
    var rankCounts = RankCounts()
    var suitCounts = SuitCounts()

    for card in cards {
        rankCounts[card.rank, default: 0] += 1
        suitCounts[card.suit, default: 0] += 1
    }

    let (isStraight, highRank) = hasStraight(rankCounts)

    if isStraight {
        if hasFlush(suitCounts) {
            if highRank == .ace {
                return .royalFlush
            }
            else {
                return .straightFlush
            }
        }
        else {
            return .straight
        }
    }

    if hasFourOfAKind(rankCounts) {
        return .fourOfAKind
    }

    if hasFlush(suitCounts) {
        return .flush
    }

    if hasThreeOfAKind(rankCounts) {
        return hasPair(rankCounts)
            ? .fullHouse
            : .threeOfAKind
    }

    if hasTwoPair(rankCounts) {
        return .twoPair
    }

    if hasJacksOrBetterPair(rankCounts) {
        return .jacksOrBetter
    }

    return .loss
}

private let faceRanks: [Rank] = [
    .jack, .queen, .king, .ace
]

let possibleStraights: [[Rank]] = [
    [.ace,   .two,   .three, .four,  .five],
    [.two,   .three, .four,  .five,  .six],
    [.three, .four,  .five,  .six,   .seven],
    [.four,  .five,  .six,   .seven, .eight],
    [.five,  .six,   .seven, .eight, .nine],
    [.six,   .seven, .eight, .nine,  .ten],
    [.seven, .eight, .nine,  .ten,   .jack],
    [.eight, .nine,  .ten,   .jack,  .queen],
    [.nine,  .ten,   .jack,  .queen, .king],
    [.ten,   .jack,  .queen, .king,  .ace],
]

/// Returns `true` and high card rank if there is a
/// straight.  Otherwise returns `false` and
/// undefined rank.
private func hasStraight(_ rankCounts: RankCounts) -> (Bool, Rank) {
    if rankCounts.contains(where: { $0.value > 1 }) {
        return (false, .ace)
    }

    for possibleStraight in possibleStraights {
        if hasAllRanks(rankCounts, ranks: possibleStraight) {
            return (true, possibleStraight.last!)
        }
    }

    return (false, .ace)
}

private func hasAllRanks(_ rankCounts: RankCounts, ranks: [Rank]) -> Bool {
    for rank in ranks {
        if !rankCounts.contains(where: { $0.key == rank }) {
            return false
        }
    }
    return true
}

private func hasFlush(_ suitCounts: SuitCounts) -> Bool {
    suitCounts.contains{ $0.value == 5 }
}

private func hasFourOfAKind(_ rankCounts: RankCounts) -> Bool {
    rankCounts.contains{ $0.value == 4 }
}

private func hasThreeOfAKind(_ rankCounts: RankCounts) -> Bool {
    rankCounts.contains{ $0.value == 3 }
}

private func hasTwoPair(_ rankCounts: RankCounts) -> Bool {
    rankCounts.filter{ $0.value == 2 }.count == 2
}

private func hasJacksOrBetterPair(_ rankCounts: RankCounts) -> Bool {
    faceRanks.contains { rank in
        rankCounts[rank, default: 0] == 2
    }
}

private func hasPair(_ rankCounts: RankCounts) -> Bool {
    rankCounts.contains{ $0.value == 2 }
}

