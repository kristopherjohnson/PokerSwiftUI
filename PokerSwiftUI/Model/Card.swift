/// Representation of a playing card
struct Card: Equatable, CustomStringConvertible {
    let rank: Rank
    let suit: Suit
    
    /// Unique identifier, used to implement SwiftUI.Identifiable
    let id: Int8
    
    init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.id = rank.rawValue + (suit.rawValue << 4)
    }
    
    var symbol: String {
        "\(rank.symbol)\(suit.symbol)"
    }

    var description: String {
        "\(rank) of \(suit)"
    }
}
