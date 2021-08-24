//
//  ShopViewModel.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import Foundation

class ShopViewModel {

    private (set) var shops :[Shop] = [Shop]()
    
    func getShopData(completion: @escaping () -> ()) {
        shops = load("pathao-shop.json")
       
        completion()
    }
    
    func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
}
