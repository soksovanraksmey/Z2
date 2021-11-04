//
//  GetStartVC.swift
//  Z2
//
//  Created by zed on 11/3/21.
//


struct BoardingItem {
    let image: String
    let title: String
    let discrip:String
}

import UIKit

class GetStartVC: UIViewController{
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnGetStart: UIButton!
    
    let image:[BoardingItem] = [
        BoardingItem(image:"onboarding_1" , title: "Z2 App", discrip: "Beyond Real Estate Marketplace"),
        BoardingItem(image: "onboarding_2", title: "Real Time Property Listings", discrip: "Take a tour or Contact directly"),
        BoardingItem(image: "onboarding_3", title: "Globally Various Properties", discrip: "Buy, Sell, and Rent"),
        BoardingItem(image: "onboarding_4", title: "Indication List", discrip: "See your historical cases "),
        BoardingItem(image: "onboarding_5", title: "Real Estate News & Insights", discrip: "Property News & Trends")
    ]
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.isNavigationBarHidden = true
        collection.dataSource = self
        collection.delegate = self
        
        
        let nib = UINib(nibName: "CollectionViewCellVC", bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: "CollectionViewCellVC")
        
//        let flowlayout = self.collection.collectionViewLayout as? UICollectionViewFlowLayout
//        flowlayout?.scrollDirection = .horizontal
//
//
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = .zero
        collection.contentOffset = .zero
        collection.isPagingEnabled = true
        
        pageControl.numberOfPages = image.count
        btnGetStart.isHidden = true
    }
    
    
    @IBAction func btnGetStart(_ sender: Any) {

        let vc = UIStoryboard(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "home")
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
  

}

extension GetStartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNum = scrollView.contentOffset.x,width = scrollView.frame.size.width
        if width == 0 { return }
        let pageIndex = Int(pageNum / width)
        if btnGetStart.isHidden && pageIndex == image.count - 1 {
            btnGetStart.isHidden = false
            pageControl.isHidden = true
        }else if pageControl.isHidden && pageIndex < image.count - 1{
            btnGetStart.isHidden = true
            pageControl.isHidden = false
        }
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
        if let indexPath = collection.indexPathForItem(at: center) {
            pageControl.currentPage = indexPath.row
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width, height: collection.frame.height)
        }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellVC", for: indexPath) as! CollectionViewCellVC
        cell.img.image = UIImage(named: image[indexPath.row].image)
        cell.lblTitle.text = image[indexPath.row].title
        cell.lblDiscription.text = image[indexPath.row].discrip
        
        // Testing bcakground collection
//        switch indexPath.row {
//        case 0:
//            cell.backgroundColor = .green
//        case 1:
//            cell.backgroundColor = .red
//        case 2:
//            cell.backgroundColor = .purple
//        case 3:
//            cell.backgroundColor = .yellow
//        case 4:
//            cell.backgroundColor = .gray
//        default:()
//        }
        return cell
    }
    
   
   
}
