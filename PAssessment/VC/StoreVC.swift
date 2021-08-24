//
//  StoreVC.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import UIKit

class StoreVC: UIViewController {
    @IBOutlet weak var tblStore: UITableView!
    
    @IBOutlet weak var lblTotalPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Store"
        lblTotalPrice.text = "\(StoreManager.shared.getTotal())"
    }

}

extension StoreVC: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: -TableviewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return StoreManager.shared.cart.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell") as? StoreTableViewCell else { return UITableViewCell() }
        let storeItem = StoreManager.shared.cart[indexPath.row]
        cell.storeItem = storeItem

        return cell
    }
    
    //MARK: -TableviewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

