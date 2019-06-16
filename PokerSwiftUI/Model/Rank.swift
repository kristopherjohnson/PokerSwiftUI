/// Rank of a `Card`
enum Rank: Int8, CaseIterable, CustomStringConvertible {
    case ace = 1
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
    
    var description: String {
        switch self {
        case .ace:   return "Ace"
        case .two:   return "Two"
        case .three: return "Three"
        case .four:  return "Four"
        case .five:  return "Five"
        case .six:   return "Six"
        case .seven: return "Seven"
        case .eight: return "Eight"
        case .nine:  return "Nine"
        case .ten:   return "Ten"
        case .jack:  return "Jack"
        case .queen: return "Queen"
        case .king:  return "King"
        }
    }
}
