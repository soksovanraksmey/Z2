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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageSell.layer.cornerRadius = 10
        imageSell.layer.shadowOffset = CGSize(width: 10,
                                                height: 10)
        imageSell.layer.shadowRadius = 3
        imageSell.layer.shadowOpacity = 0.3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
