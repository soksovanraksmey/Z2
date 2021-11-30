//
//  LatestPropertyTableViewCell.swift
//  Z2
//
//  Created by zed on 11/8/21.
//

import UIKit

class LatestPropertyTableViewCell: UITableViewCell {
    
    
    @IBOutlet var imageSell: UIImageView!
    
    @IBOutlet var viewDate: UIView!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var viewCount: UILabel!
    @IBOutlet weak var listingAge: UILabel!
    @IBOutlet weak var favorite: UIButton!
    @IBOutlet weak var landArea: UILabel!
    @IBOutlet weak var shortAddress: UILabel!
    @IBOutlet weak var propertyType: UILabel!
    
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageSell.layer.cornerRadius = 10
        viewDate.layer.cornerRadius = 9
        viewDate.layer.maskedCorners = [.layerMinXMinYCorner]
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnLike(_ sender: Any) {
        
        if btnLike.tag == 0 { // like
            btnLike.setImage(UIImage(named: "unfavorite"), for: .normal)
            btnLike.tag = 1
        }else {
            // unLike
            btnLike.setImage(UIImage(named: "favorite"), for: .normal)
            btnLike.tag = 0
        }
        
        
        
    }
    
}
