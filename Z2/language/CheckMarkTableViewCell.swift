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
        
        
    
        
        
    }

    public func bindData(langugae: Language) {
        imageFlag.image = UIImage(named: langugae.flag)
        nameContry.text = langugae.title
        // long check
        if langugae.isCheck == true {
            tbnCheck.isHidden = false
        } else {
            tbnCheck.isHidden = true
        }
        // shrot check
//            tbnCheck.isHidden = !langugae.isCheck
    }
    
}
