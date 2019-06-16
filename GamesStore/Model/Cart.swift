import Foundation
import RealmSwift

class Cart: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var gameDescription: String = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var score: Int = 0
    @objc dynamic var platform: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var count: Int = 0
    
    func addGameInCart(game: Game) {
        let realm = try! Realm()
        let cart = realm.objects(Cart.self).filter("id = %d", game.id).first
        
        if cart == nil {
            try! realm.write {
                let cart = Cart()
                cart.id = game.id
                cart.name = game.name
                cart.gameDescription = game.gameDescription
                cart.price = game.price
                cart.score = game.score
                cart.platform = game.platform
                cart.image = game.image
                cart.count += 1
                realm.add(cart)
            }
            return
        }
        
        try! realm.write {
            cart!.count += 1
            realm.add(cart!)
        }
    }
    
    func calculateShipping(total:Double) -> Double {
        if total > 250 {
            return 0.0
        }
        
        let realm = try! Realm()
        let gamesInCart = realm.objects(Cart.self)
        var shippingValue: Double = 0.0
        for game in gamesInCart {
            shippingValue += Double(game.count) * 10.0
        }
        return shippingValue
    }
    
    func calculateTotal() -> Double {
        let realm = try! Realm()
        let gameInCart = realm.objects(Cart.self)
        var total: Double = 0.0
        for game in gameInCart {
            total += Double(game.count) * game.price
        }
        
        return total
    }
    
    func searchGame(gameId: Int) -> Results<Cart>{
        let realm = try! Realm()
        let cart = realm.objects(Cart.self).filter("id== \(gameId)")
        
        return cart
    }
}
