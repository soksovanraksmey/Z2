//
//  BannerTableViewCell.swift
//  Z2
//
//  Created by zed on 11/8/21.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let image = ["banner1","banner2","banner3"]
    
    let page = BannerCollectionViewCell()
    
    var time = Timer()
    var counter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.contentInset = .zero
        collectionView.contentOffset = .zero
        collectionView.register(BannerCollectionViewCell.nib, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        
    }
    
    @objc func changeImage(){
        
        if counter < image.count{
            let  index = IndexPath.init(item: counter , section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        }else {
            counter = 0
            let  index = IndexPath.init(item: counter , section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
        }
        
        
    }
    
    
}

extension BannerTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
        if let indexPath = collectionView.indexPathForItem(at: center) {
            pageControl.currentPage = indexPath.row
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell
        
        cell?.imageBanner.image = UIImage(named: image[indexPath.row])
//        cell.pageControl.currentPage = indexPath
//            switch indexPath.row {
//                  case 0:
//                      cell.backgroundColor = .green
//                  case 1:
//                      cell.backgroundColor = .red
//                  case 2:
//                      cell.backgroundColor = .purple
//                  default:()
        
        return (cell ?? nil)! as UICollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    
    
}
// extension of id identifier
extension UICollectionViewCell {

public static var id:String {
    return String(describing: self.self)
}

public static var nib: UINib {
    return UINib(nibName: self.id, bundle: nil)
}
}
