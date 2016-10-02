

import Foundation


class Deck{
    
    var privateUndealt : [Card]
    var privateDealt : [Card]
    
    var description : String {
        
        return "Cards Remaining: \(privateUndealt.count) \n Cards Dealt: \(privateDealt.count)"
    }
    
    
    init() {
        
        var cards : [Card] = []
        
        for rank in Card.validRanks() {
            
            for suit in Card.validSuits() {
                
                let newCard = Card(suit: suit, rank: rank)
                cards.append(newCard)
                
            }
        }
        
        self.privateDealt = []
        self.privateUndealt = cards
    }
    
    
    
    
    func drawCard() -> Card {
        let card = privateUndealt.removeLast()
        self.privateDealt.append(card)
        return card
    }
    
    
    
    func shuffle() {
        self.privateUndealt.append(contentsOf: privateDealt)
        self.privateDealt.removeAll()
        self.randomize()
        
    }
    
    
    func randomize() {
        var tempDeck : [Card] = []
        
        let deckCount = privateUndealt.count
        
        for _ in 0..<deckCount {
            
            let randomCardIndex = Int(arc4random_uniform(UInt32(privateUndealt.count)))
            
            let randomCardRemoved = privateUndealt.remove(at: randomCardIndex)
            
            tempDeck.append(randomCardRemoved)
        }
        
        privateUndealt = tempDeck
        
    }
}


func descriptionOfCards(cards: [Card]) -> [String] {
    
    var stringOfCardLabels = [""]
    
    for card in cards {
        
        stringOfCardLabels.append(card.cardLabel)
        
    }
    
    return stringOfCardLabels
}

