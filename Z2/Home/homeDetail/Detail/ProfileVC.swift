//
//  ViewController.swift
//  Z2
//
//  Created by Zed on 18/11/21.
//

import UIKit

public struct Setting{
    
    let image : String
    let title : String
  
}

class ProfileVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileImage: UIImageView!
        
    
    let section1 = [Setting(image:  "MeLanguage", title: "Language")]
    
    let section2 = [Setting(image:  "MeContact", title: "Contack Us"),
                   Setting(image:  "MeRating", title: "Rate this App"),
                   Setting(image:  "MeShareAppLink", title: "Share Z2 App"),
                   Setting(image:  "MeHelp", title: "Help")
                    ]
    
    let section3 = [ Setting(image: "MeTerm", title: "Term Of Use"),
                     Setting(image: "MePrivacy", title: "Privacy Policy")
                    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  UserDefaults.standard.bool(forKey: "login") == true{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileSingUp")
            navigationController?.pushViewController(vc!, animated: false)
            
        }
        
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(GeneralCell.nib, forCellReuseIdentifier: GeneralCell.id)
        tableView.register(GeneralCell.nib
                           , forCellReuseIdentifier: GeneralCell.id)
        tableView.register(GeneralCell.nib, forCellReuseIdentifier: GeneralCell.id)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true

    }
   
    @IBAction func singUp(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "singUp")
//        navigationController?.present(vc!, animated: true)
        navigationController?.pushViewController(vc!, animated: true)
    
    }
    
}


extension ProfileVC : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2 :
            return 2
        default:
            return 0
        }
   
 
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
                
            return "GENERAL"
        }else if section == 1{
            return "SUPPORT"
        }else if section == 2 {
            return "LEGAL INFORMATION"
        }
        
        return nil
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralCell.id ,for: indexPath) as! GeneralCell
            cell.iconImage.image = UIImage(named: section1[indexPath.row].image)
            cell.title.text = section1[indexPath.row].title
            
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralCell.id, for: indexPath) as! GeneralCell
            cell.iconImage.image = UIImage(named: section2[indexPath.row].image)
            cell.title.text = section2[indexPath.row].title
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralCell.id, for: indexPath) as! GeneralCell
            cell.iconImage.image = UIImage(named: section3[indexPath.row].image)
            cell.title.text = section3[indexPath.row].title
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0 :
            return 48
        case 1 :
            return 48
        case 2 :
            return 48
        default:
            return 0
        }
    }
    
    
    
    
}
