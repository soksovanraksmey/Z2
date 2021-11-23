//
//  TableViewCellSection6.swift
//  Z2
//
//  Created by Mac on 14/11/21.
//

import UIKit

class TableViewCellSection6: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let buttonName = ["Eudcation","Finance& Banking","Food & Beverages","Landmark","Life Style","religion","Other Service"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CollectionViewCellButton6.nib, forCellWithReuseIdentifier: CollectionViewCellButton6.id)
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
              flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            }
        
    }

    
    
}

extension TableViewCellSection6: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return buttonName.count
}

    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 3
}
//
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 3
}

//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////    return CGSize(width: collectionView.frame.width, height: 87)
//    let collectionViewWidth = collectionView.bounds.width
//    return CGSize(width: collectionViewWidth/3, height: collectionViewWidth/3)
//}




func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellButton6.id, for: indexPath) as! CollectionViewCellButton6
    
    cell.btnService.setTitle(buttonName[indexPath.row], for: .normal)
    
    return cell
}





}
