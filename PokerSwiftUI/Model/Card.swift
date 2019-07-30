import Foundation

/// Representation of a playing card
struct Card: Equatable, Hashable, CustomStringConvertible, Identifiable {
    let rank: Rank
    let suit: Suit
    
    /// Unique identifier, used to implement SwiftUI.Identifiable
    let id: UUID
    
    init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.id = UUID()
    }
    
    var symbol: String {
        "\(rank.symbol)\(suit.symbol)"
    }

    var description: String {
        "\(rank) of \(suit)"
    }
}
