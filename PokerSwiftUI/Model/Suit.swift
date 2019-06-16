/// Suit of a `Card`
enum Suit: Int8, CaseIterable, CustomStringConvertible {
    case clubs
    case diamonds
    case hearts
    case spades
    
    /// Unicode character for a playing-card suit
    var symbol: String {
        switch self {
        case .clubs:    return "\u{2663}"
        case .diamonds: return "\u{2666}"
        case .hearts:   return "\u{2665}"
        case .spades:   return "\u{2660}"
        }
    }
    
    var description: String {
        switch self {
        case .clubs:    return "Clubs"
        case .diamonds: return "Diamonds"
        case .hearts:   return "Hearts"
        case .spades:   return "Spades"
        }
    }
}
