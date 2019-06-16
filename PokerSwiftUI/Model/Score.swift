/// Loss or type of winning hand.
enum Score : CustomStringConvertible {
    case loss
    case jacksOrBetter
    case twoPair
    case threeOfAKind
    case straight
    case flush
    case fullHouse
    case fourOfAKind
    case straightFlush
    case royalFlush
    
    /// Payout per chip bet
    var payout: Int {
        switch self {
        case .loss:          return 0
        case .jacksOrBetter: return 1
        case .twoPair:       return 2
        case .threeOfAKind:  return 3
        case .straight:      return 4
        case .flush:         return 6
        case .fullHouse:     return 9
        case .fourOfAKind:   return 25
        case .straightFlush: return 50
        case .royalFlush:    return 800
        }
    }

    var description: String {
        switch self {
        case .loss:          return "Loss"
        case .jacksOrBetter: return "Pair"
        case .twoPair:       return "Two Pair"
        case .threeOfAKind:  return "Three of a Kind"
        case .straight:      return "Straight"
        case .flush:         return "Flush"
        case .fullHouse:     return "Full House"
        case .fourOfAKind:   return "Four of a Kind"
        case .straightFlush: return "Straight Flush"
        case .royalFlush:    return "Royal Flush"
        }
    }
}
