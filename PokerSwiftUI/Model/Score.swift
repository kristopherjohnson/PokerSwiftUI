/// Hard-coded number of credits per bet.
///
/// In the future, this may be something the player can choose.
let creditsPerBet = 5

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
        case .loss:          return creditsPerBet * 0
        case .jacksOrBetter: return creditsPerBet * 1
        case .twoPair:       return creditsPerBet * 2
        case .threeOfAKind:  return creditsPerBet * 3
        case .straight:      return creditsPerBet * 4
        case .flush:         return creditsPerBet * 6
        case .fullHouse:     return creditsPerBet * 9
        case .fourOfAKind:   return creditsPerBet * 25
        case .straightFlush: return creditsPerBet * 50
        case .royalFlush:    return creditsPerBet * 800
        }
    }

    var description: String {
        switch self {
        case .loss:          return "Loss"
        case .jacksOrBetter: return "High Pair"
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
