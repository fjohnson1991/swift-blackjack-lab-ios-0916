
import Foundation


class Player {
    
    var name : String
    var cards : [Card] = []
    var stayed : Bool = false
    var handscore : UInt {
        
        return self.getHandscore()
        
    }
    
    init(name: String) {
        
        self.name = name
        self.tokens = 100
        
    }
    
    var blackjack : Bool {
        
        if handscore == 21 && cards.count == 2 {
            
            return true
        }
        
        return false
        
    }
    
    var busted : Bool {
        
        if handscore > 21 {
            
            return true
        }
        
        return false
    }
    
    
    var mayHit : Bool {
        
        if !busted  && !blackjack && !stayed {
            
            return true
        }
        
        return false
    }
    
    var tokens : UInt
    var description : String {
        
        return "player : \(name) \n handscore : \(handscore) \n blackjack : \(blackjack) \n busted : \(busted) \n stayed : \(stayed) \n tokens : \(tokens) \n cards : \(cards)".lowercased()
        
    }
    
    
    
    func getHandscore() -> UInt {
        
        var score : UInt = 0
        
        for card in cards {
            
            score += card.cardValue
        }
        
        if self.hasAce() && score <= 11{
            
            score += 10
        }
        
        return score
        
    }
    
    func hasAce() -> Bool {
        
        for card in cards {
            
            if card.rank == "A" {
                
                return true
                
            }
        }
        
        return false
        
    }
    
    func canPlace(bet: UInt) -> Bool {
        
        if tokens >= bet {
            
            return true
        }
        
        return false
    }
    
    func didWin(bet: UInt) {
        
        tokens += bet
        
    }
    
    
    func didLose(bet: UInt) {
        
        tokens -= bet
    }
}
