//
//  ChangeProfilePhoto.swift
//  Z2
//
//  Created by Zed on 28/11/21.
//

import UIKit

class ChangeProfilePhoto: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        navigationController?.isNavigationBarHidden = false
        title = "Profile"
        

    }
    

   

}

extension ChangeProfilePhoto: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    
    
    
    
    
    
    
}
