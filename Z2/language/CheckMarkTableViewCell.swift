//
//  CheckMarkTableViewCell.swift
//  Z2
//
//  Created by zed on 11/12/21.
//

import UIKit

class CheckMarkTableViewCell: UITableViewCell {

    @IBOutlet var imageFlag: UIImageView!
    @IBOutlet var nameContry: UILabel!
    @IBOutlet var tbnCheck: UIButton!
    
    var isCheck = false
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        tbnCheck.isHidden = true
        
    
        
        
    }

    
}
