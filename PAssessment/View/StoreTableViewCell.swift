//
//  StoreTableViewCell.swift
//  PAssessment
//
//  Created by Enam on 8/25/21.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemPrice: UILabel!
    @IBOutlet weak var btnAddItem: UIButton!
    @IBOutlet weak var btnRemoveItem: UIButton!
    
    var storeItem: StoreItem? {
       didSet{
           if let storeItem = storeItem {
            lblCount.text = "Total Count: \(storeItem.quantity)"
            lblItemName.text = storeItem.item.name
            lblItemPrice.text = "Total Price: \(storeItem.totalPrice)"
            itemImageView.setImgWebUrl(url: storeItem.item.image, isIndicator: true)

           }
       }
    }

    var items:[Item] = []
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    override func layoutSubviews() {
        
        self.containerView.layer.cornerRadius = 5
        self.containerView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
        StoreManager.shared.valueChanged = { [weak self] value in
            if value{
            }
        }

    }
    
    @IBAction func addItemAction(sender: UIButton) {
        if let storeItem = storeItem {
            StoreManager.shared.addItem(storeItem.item)
            lblCount.text = "Total Count: \(StoreManager.shared.totalQuantity(storeItem.item))"
            lblItemPrice.text = "Total Price: \(storeItem.totalPrice)"
        }
    }
    
    @IBAction func removeItemAction(sender: UIButton) {
        if let storeItem = storeItem {
            StoreManager.shared.removeItem(storeItem.item)
            lblCount.text = "Total Count:\(StoreManager.shared.totalQuantity(storeItem.item))"
            lblItemPrice.text = "Total Price: \(storeItem.totalPrice)"
        }
    }
}

