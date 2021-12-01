//
//  InfoDetail.swift
//  Z2
//
//  Created by zed on 11/10/21.
//

import UIKit

class InfoDetail: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnCall: UIButton!
    
    @IBOutlet weak var btnBookVisit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        tableView.dataSource = self
        tableView.delegate = self
       

        btnCall.layer.cornerRadius = 5
        btnBookVisit.layer.cornerRadius = 5
    
        btnBookVisit.layer.borderWidth = 1
        btnBookVisit.layer.borderColor = UIColor.systemTeal.cgColor
        
        tableView.register(TableViewCellSection1.nib, forCellReuseIdentifier: TableViewCellSection1.id)
        tableView.register(TableViewCellSection2.nib, forCellReuseIdentifier: TableViewCellSection2.id)
        tableView.register(TableViewCellSection3.nib, forCellReuseIdentifier: TableViewCellSection3.id)
        tableView.register(TableViewCellSection4.nib, forCellReuseIdentifier: TableViewCellSection4.id)
        tableView.register(TableViewCellSection5.nib, forCellReuseIdentifier: TableViewCellSection5.id)
        tableView.register(TableViewCellSection6.nib, forCellReuseIdentifier: TableViewCellSection6.id)
        tableView.register(TableViewCellSection7.nib, forCellReuseIdentifier: TableViewCellSection7.id)
        tableView.register(TableViewCellSection8.nib, forCellReuseIdentifier: TableViewCellSection8.id)
        tableView.register(TableViewCellSection9.nib, forCellReuseIdentifier: TableViewCellSection9.id)

        
    }
    

  

}


extension InfoDetail: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        case 5:
            return 1
        case 6:
            return 1
        case 7:
            return 1
        case 8:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection1.id, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection2.id, for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection3.id, for: indexPath)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection4.id, for: indexPath)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection5.id, for: indexPath)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection6.id, for: indexPath)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection7.id, for: indexPath)
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection8.id, for: indexPath)
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellSection9.id, for: indexPath)
            return cell
        default:
            
            
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0 :
            return 420
        case 1 :
            return 140
        case 2 :
            return 298
        case 3 :
            return 174
        case 4 :
            return 142
        case 5 :
            return 466
        case 6 :
            return 300
        case 7 :
            return 300
        case 8 :
            return 133
//            
        default:
            return 0
            
        }
    }

    
}

