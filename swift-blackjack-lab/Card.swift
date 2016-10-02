
import Foundation



class Card{
    
    var suit : String
    var rank : String
    var cardLabel : String {
        
        return "\(suit)\(rank)"
        
    }
    
    convenience init() {
        self.init(suit: "", rank: "")
    }
    
    init(suit: String, rank: String) {
        
        self.suit = suit
        self.rank = rank
        
    }
    
    var description : String {
        
        return cardLabel
    }
    
    var numberCards = ["2","3","4","5","6","7","8","9"]
    var cardValue : UInt {
        
        return cardValueFromLabel()
    }
    
    func cardValueFromLabel() -> UInt {
        
        if rank.contains("A") {
            
            return 1
            
            
        } else if numberCards.contains(rank)  {
            
            if let unwrappedRank = UInt(rank) {
                
                return unwrappedRank
            }
        }
        
        return 10
    }
    
    
    class func validSuits() -> [String] {
        
        return ["♥", "♦", "♠", "♣︎"]
        
    }
    
    class func validRanks() -> [String] {
        
        return ["A","2","3","4","5","6","7","8","9","10","J", "Q", "K"]
    }
    
    
}
