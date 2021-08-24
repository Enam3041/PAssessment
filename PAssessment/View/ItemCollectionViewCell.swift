//
//  ItemCollectionViewCell.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import Foundation
import UIKit
@_exported import SDWebImage

protocol ItemCollectionViewCellDelegate {
    func didSelectItem(_ view:ItemCollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblItemDescription: UILabel!
    @IBOutlet weak var lblItemPrice: UILabel!
    @IBOutlet weak var btnAddItem: UIButton!
    @IBOutlet weak var btnRemoveItem: UIButton!
    
    var item: Item? {
       didSet{
           if let item = item {
            lblCount.text = "\(StoreManager.shared.totalQuantity(item))"
            lblItemName.text = item.name
            lblItemDescription.text = item.description
            lblItemPrice.text = "\(item.price)"
            itemImageView.setImgWebUrl(url: item.image, isIndicator: true)

           }
       }
    }

    override func layoutSubviews() {
        containerView.layer.cornerRadius = 6
        containerView.clipsToBounds = true
        
        self.containerView.layer.borderColor = UIColor.black.cgColor
        self.containerView.layer.borderWidth = 1
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        }
    
    @IBAction func addItemAction(sender: UIButton) {
        if let item = item {
            StoreManager.shared.addItem(item)
            lblCount.text = "\(StoreManager.shared.totalQuantity(item))"
        }
    }
    
    @IBAction func removeItemAction(sender: UIButton) {
        if let item = item {
            StoreManager.shared.removeItem(item)
            lblCount.text = "\(StoreManager.shared.totalQuantity(item))"
        }
    }

}

extension UIImageView{
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setImgWebUrl(url : String, isIndicator : Bool){
        
        if isIndicator == true{
            self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        }
            self.sd_setImage(with: URL(string:url), placeholderImage: UIImage(named: "default"), options: .lowPriority, progress: nil
            , completed: { (image, error, cacheType, url) in
                guard image != nil else {
                    return
                }
            })
    }
}
