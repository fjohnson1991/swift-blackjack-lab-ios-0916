
import Foundation


class Dealer {
    
    var deck = Deck()
    var house = House(name: "House")
    var player = House(name: "Player")
    var bet : UInt = 0
    
    
    func place(bet: UInt) -> (Bool) {
        
        if player.tokens >= bet && house.tokens >= bet {
            self.bet = bet
            return true
            
        } else {
            
            self.bet = 0
            return false
        }
    }
    
    func deal() {
        
        deck.shuffle()
        player.cards.removeAll()
        house.cards.removeAll()
        player.stayed = false
        house.stayed = false
        
        for _ in 0...1 {
            
            player.cards.append(deck.drawCard())
            house.cards.append(deck.drawCard())
            
        }
    }
    
    func turn(house: House) {
        
        if !house.busted && !house.stayed && !house.blackjack {
            
            if house.mustHit {
                
                house.cards.append(deck.drawCard())
                
            } else {

                house.stayed = true
                
            }
        }
    }
    
    
    func winner() -> String {
        
        
        if player.blackjack && !house.blackjack {
            
            return "player"
            
        }
        
        if !player.blackjack && house.blackjack {
            
            return "house"
            
        }
        
        if player.busted {
            
            return "house"
            
        }
        
        if house.busted {
            
            return "player"
            
        }
        
        if player.cards.count == 5 && !player.busted {
            
            return "player"
            
        }
        
        if house.stayed && player.stayed {
            
            if player.handscore > house.handscore {
                
                return "player"
                
            } else {
                
                return "house"
            }
            
        }
            
        return "no"

    }
    
    
    func award() -> String {
        
        var awardString = ""
        
        if winner() == "player" {
            
            player.tokens += bet
            house.tokens -= bet
            awardString = "Player wins. Player tokens: \(player.tokens) \n House tokens: \(house.tokens)"
            
        } else if winner() == "house" {
            
            player.tokens -= bet
            house.tokens += bet
            awardString = "House wins. Player tokens: \(player.tokens) \n House tokens: \(house.tokens)"
        } else {
            
            awardString = "no winner yet"
        }
        
        return awardString
    }
    
}
