//
//  ChangeProfilePhoto.swift
//  Z2
//
//  Created by Zed on 28/11/21.
//

import UIKit

class ChangeProfilePhoto: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let titleName = ["First Name","Last Name","Phone Number"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        navigationController?.isNavigationBarHidden = false
        title = "Profile"
        
//            navigationItem.backBarButtonItem = UIBarButtonItem(title: " ")
      
        
        tableView.register(ProfileDetailTableViewCell.nib, forCellReuseIdentifier: ProfileDetailTableViewCell.id)

    }

    
}

extension ChangeProfilePhoto: UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileDetailTableViewCell.id, for: indexPath) as! ProfileDetailTableViewCell
       
        
        cell.titleName.text = titleName[indexPath.row]
//        cell.lblName.text = tfPhone.text
        
            
        return cell
    }
    
    
    
    
    
    
    
    
}
