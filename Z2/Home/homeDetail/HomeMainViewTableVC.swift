//
//  HomeMainViewVC.swift
//  Z2
//
//  Created by zed on 11/6/21.
//

import UIKit

class HomeMainViewTableVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BannerTableViewCell.nib, forCellReuseIdentifier: BannerTableViewCell.id)
        tableView.register(LatestPropertyTableViewCell.nib, forCellReuseIdentifier: LatestPropertyTableViewCell.id)
    }
    

}
 
extension HomeMainViewTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello world")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 8
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.id, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestPropertyTableViewCell.id, for: indexPath)
            return cell
        default:
            
            
            return UITableViewCell()
        }

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 { return 100 }
        return 211
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            
            return "Latest Property"
        }
        
        return nil
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
////        switch indexPath.section{
////        case 0 :
////            print("hello")
////        case 1 :
////            let vc = UIStoryboard(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "detail") as? InfoDetail
////            self.navigationController?.pushViewController(vc!, animated: true)
////
////        default:
////            print(Error.self)
////        }
//        print("hello")
//
//    }
    
    
    
 
}



    // extension of id identifier
extension UITableViewCell {
    
    public static var id:String {
        return String(describing: self.self)
    }
    
    public static var nib: UINib {
        return UINib(nibName: self.id, bundle: nil)
    }
}
