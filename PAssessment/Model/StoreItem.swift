//
//  StoreItem.swift
//  PAssessment
//
//  Created by Enam on 8/25/21.
//

import Foundation

struct StoreItem {
    
    let quantity: Int
    let item: Item

    init(_ item:Item,quantity:Int) {
        self.item = item
        self.quantity = quantity
    }
    
    
    var totalPrice: Int{
        return self.item.price * self.quantity
    }
   
}

