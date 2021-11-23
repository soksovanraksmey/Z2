//
//  CollectionViewCellDetail.swift
//  Z2
//
//  Created by Mac on 15/11/21.
//

import UIKit

class CollectionViewCellDetail: UICollectionViewCell {

    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var iamgeBackground: UIImageView!
    
    @IBOutlet weak var viewDate: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iamgeBackground.layer.cornerRadius = 10

        viewDate.layer.cornerRadius = 8
        viewDate.layer.maskedCorners = [.layerMinXMinYCorner]
        
        

    }


    @IBAction func btnFavorite(_ sender: Any) {
   
        if btnLike.tag == 0 { // Empty
            btnLike.setImage(UIImage(named: "unfavorite"), for: .normal)
            btnLike.tag = 1
            
            
        }else{ // No Empty
            btnLike.setImage(UIImage(named: "favorite"), for: .normal)
            btnLike.tag = 0
        }
        
        
    }
    

}
