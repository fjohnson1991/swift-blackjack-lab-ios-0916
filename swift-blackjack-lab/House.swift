
import Foundation

class House: Player {
    
    override init(name: String) {
        
        super.init(name: name)
        
        tokens = 1000
        cards = []
    }
    
    var mustHit : Bool {
        
        if handscore < 17 {
            
            return true
        }
        
        return false
    }
    
    
    
}
