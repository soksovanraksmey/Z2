//
//  FavoriteList.swift
//  Z2
//
//  Created by Zed on 27/11/21.
//

import Foundation
import UIKit

class FavoriteList: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LatestPropertyTableViewCell.nib, forCellReuseIdentifier: LatestPropertyTableViewCell.id)
        
    }
    
    
}

extension FavoriteList: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LatestPropertyTableViewCell.id, for: indexPath)
        as! LatestPropertyTableViewCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//

        return 211
    }
    
    
    
    
}
