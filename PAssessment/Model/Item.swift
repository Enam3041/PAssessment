//
//  Item.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import Foundation

struct Shop: Codable {
   var shopName: String
   var items: [Item]
    
    enum CodingKeys: String, CodingKey {
       case items
       case shopName = "shop_name"
     }
}


struct Item:Codable {
    let name: String
    var description: String
    var image: String
    let price: Int

    init(name: String, description: String,image:String, price: Int){
        self.name = name
        self.description = description
        self.image = image
        self.price = price
    }
}
