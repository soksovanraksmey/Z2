//
//  TableViewCellSection9.swift
//  Z2
//
//  Created by Mac on 15/11/21.
//

import UIKit

class TableViewCellSection9: UITableViewCell {

    @IBOutlet weak var btnFind: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        btnFind.layer.cornerRadius = 5
        btnFind.layer.borderWidth = 1
        btnFind.layer.borderColor = UIColor.systemTeal.cgColor
        
     
        
        

    }

  
    
}
