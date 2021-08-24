//
//  ItemTableViewCell.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import Foundation
import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ItemCollectionView: UICollectionView!
    
    var items:[Item] = []
    
    override func prepareForReuse() {
        super.prepareForReuse()
            resetCollectionView()
    }
    
    func resetCollectionView() {
        guard items.count <= 0 else { return }
        items = []
        ItemCollectionView.reloadData()
    }
    
    override func layoutSubviews() {
        
        self.containerView.layer.cornerRadius = 5
        self.containerView.clipsToBounds = true
       
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
        self.ItemCollectionView.dataSource = self
        self.ItemCollectionView.delegate = self
    }
}

extension ItemTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return  items.count > 5 ? 5 : items.count

      }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        if  items.count > indexPath.row {
            let item = items[indexPath.row]
            cell.item = item
        }else{
            return UICollectionViewCell()
        }

        return cell

      }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.delegate.didSelectItem(petModel)
    }
}

extension ItemTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ItemCollectionView.frame.size.width-10, height: ItemCollectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
