//
//  StoreManager.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import Foundation
class StoreManager {
    
    static let shared = StoreManager()
    var cart = [StoreItem]()
    var valueChanged : ((Bool)->())?
    
    func addItem(_ item:Item) {
        if cart.count < 5 {
        let filterCart = cart.filter{($0.item.name == item.name)}
        if filterCart.count > 0 {
            cart = cart.map {
                if ($0.item.name == item.name) {
                    return StoreItem(item, quantity:$0.quantity + 1 )
                }
                return $0
            }
        }else{
            cart.append(StoreItem.init(item, quantity: 1))
        }
    }
        
    }
    
    func totalQuantity(_ item:Item)-> Int {
        let filtCart = cart.filter{($0.item.name == item.name)}
        if filtCart.count > 0 {
            return filtCart[0].quantity
        }else{
            return 0
        }
    }
    
    func removeItem(_ item:Item) {
        if cart.count < 5 {
        let filterCart = cart.filter{($0.item.name == item.name)}
        if filterCart.count > 0 {
            if filterCart[0].quantity == 1 {
                cart = cart.filter{
                    $0.item.name != item.name
                }
            }else{
            cart = cart.map {
                if ($0.item.name == item.name) {
                    return StoreItem(item, quantity:$0.quantity - 1 )
                }
                return $0
              }
            }
        }
    }
        
    }

    
    func removeItem2(_ item:Item) {
        cart = cart.filter{
            $0.item.name != item.name
        }
        if let valueChanged = self.valueChanged{
            valueChanged(true)
        }
    }
    
    func getTotal() -> Int {
        return cart.reduce(0, sumQuantity)
    }
    
    func sumQuantity(acc: Int, element: StoreItem) -> Int {
        return acc + (element.item.price * element.quantity)
    }
}
