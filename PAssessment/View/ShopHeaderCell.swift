//
//  ShopHeaderCell.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import UIKit

//protocol ShopHeaderCellDelegate {
//    func didPressedSeeAllButton(_ shop: Shop?)
//}

class ShopHeaderCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblShopName: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!

    
    var seeAllButtonPressed :() -> () = {  }

    var shop: Shop? {
       didSet{
           if let shop = shop {
            lblShopName.text = shop.shopName
           }
       }
    }
    
   // var delegate: ShopHeaderCellDelegate!

    
    override func layoutSubviews() {
        containerView.layer.cornerRadius = 5
        containerView.clipsToBounds = true
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func seeAllButtomAction(sender: UIButton) {
        self.seeAllButtonPressed()
    }
}


    
