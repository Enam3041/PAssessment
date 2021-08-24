//
//  HomeVC.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import UIKit
 

class HomeVC: UIViewController {
    @IBOutlet weak var tblShop: UITableView!
    var viewModel:ShopViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ShopViewModel()
        self.viewModel.getShopData { [weak self] in
            self?.tblShop.reloadData()
        }
    }
    
    @IBAction func storeButtonAction(_ sender: UIBarButtonItem) {
        let storeVC:StoreVC = self.storyboard!.instantiateViewController(identifier: "StoreVC") as! StoreVC
        self.navigationController?.pushViewController(storeVC, animated: true)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    //MARK: -TableviewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.shops.count
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let shop = self.viewModel.shops[section]
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "ShopHeaderCell") as! ShopHeaderCell
        headerCell.shop = shop
        headerCell.seeAllButtonPressed = { [weak self] in
            let catVC:CategoryListVC = self?.storyboard!.instantiateViewController(identifier: "CategoryListVC") as! CategoryListVC
            catVC.items = shop.items
            self?.navigationController?.pushViewController(catVC, animated: true)
        }
 
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as? ItemTableViewCell else { return UITableViewCell() }
        let items = self.viewModel.shops[indexPath.section].items
        cell.items = items

        return cell
    }
    
    //MARK: -TableviewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
