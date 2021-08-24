//
//  CategoryListVC.swift
//  PAssessment
//
//  Created by Enam on 8/24/21.
//

import UIKit

class CategoryListVC: UIViewController {

    @IBOutlet weak var CatItemCollectionView: UICollectionView!

    internal let leftRightInset: CGFloat = 10
    internal let cellSpacing: CGFloat = 20
    
    var items:[Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension CategoryListVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return  items.count

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
    }
}

extension CategoryListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth : CGFloat = (CatItemCollectionView.frame.size.width - leftRightInset * 2 - cellSpacing*2 ) / 2

        return CGSize(width: cellWidth, height: cellWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}
