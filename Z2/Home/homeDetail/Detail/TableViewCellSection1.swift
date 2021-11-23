//
//  TableViewCellSection1.swift
//  Z2
//
//  Created by Mac on 14/11/21.
//

import UIKit

class TableViewCellSection1: UITableViewCell {

    @IBOutlet weak var collection: UICollectionView!
    
    
    var time = Timer()
    var counter = 0
    
    let image = ["banner1","banner2","banner3"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collection.delegate = self
        collection.dataSource = self
        
        collection.register(CollectionViewCellDetail1.nib, forCellWithReuseIdentifier: CollectionViewCellDetail1.id)
        // auto scrol
//        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
//
        
    }
    
//    @objc func changeImage(){
//
//        if counter < image.count{
//            let  index = IndexPath.init(item: image.count , section: 0)
//            self.collection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
////            pageControl.currentPage = counter
//            counter += 1
//        }else {
//            counter = 0
//            let  index = IndexPath.init(item: image.count , section: 0)
//            self.collection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
////            pageControl.currentPage = counter
//        }
//
//
//    }
    
}


extension TableViewCellSection1: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.width, height: 285)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel = collection.dequeueReusableCell(withReuseIdentifier: CollectionViewCellDetail1.id, for: indexPath)
        
        return cel
    }
    
    
    
    
    
    
}
