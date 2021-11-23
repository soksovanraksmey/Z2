//
//  ProfileSingUp.swift
//  Z2
//
//  Created by Zed on 18/11/21.
//

import UIKit

//struct Setting{
//    
//    let image : String
//    let title : String
//  
//}

class ProfileSingUp: UIViewController {

 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageProfile: UIImageView!
    
    let section1 = [Setting(image:  "MeLanguage", title: "Language")]
    
    let section2 = [Setting(image: "MePin", title: "Update PIN")]
    
    
    let section3 = [Setting(image:  "MeContact", title: "Contack Us"),
                   Setting(image:  "MeRating", title: "Rate this App"),
                   Setting(image:  "MeShareAppLink", title: "Share Z2 App"),
                   Setting(image:  "MeHelp", title: "Help")
                    ]
    
    let section4 = [ Setting(image: "MeTerm", title: "Term Of Use"),
                     Setting(image: "MePrivacy", title: "Privacy Policy")
                    ]
    let section5 = [Setting(image: "MeSignOut", title: "Sign Out")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(GeneralCell.nib, forCellReuseIdentifier: GeneralCell.id)
        tableView.register(GeneralCell.nib
                           , forCellReuseIdentifier: GeneralCell.id)
        tableView.register(GeneralCell.nib, forCellReuseIdentifier: GeneralCell.id)
        tableView.register(GeneralCell.nib, forCellReuseIdentifier: GeneralCell.id)
        tableView.register(GeneralCell.nib, forCellReuseIdentifier: GeneralCell.id)

        
    }
    


}

extension ProfileSingUp : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2 :
            return 4
        case 3:
            return 2
        case 4:
            return 1
            
        default:
            return 0
        }
   
 
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
                
            return "GENERAL"
        }else if section == 1{
            return "SECURITY"
        }else if section == 2 {
            return "SUPPORT"
        }else if section == 3 {
            return "LEGAL INFORMATION"
        }else if section == 4 {
            return "SING IN"
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
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralCell.id, for: indexPath) as! GeneralCell
            cell.iconImage.image = UIImage(named: section4[indexPath.row].image)
            cell.title.text = section4[indexPath.row].title
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralCell.id, for: indexPath) as! GeneralCell
            cell.iconImage.image = UIImage(named: section5[indexPath.row].image)
            cell.title.text = section5[indexPath.row].title
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
        case 3 :
            return 48
        case 4 :
            return 48
        default:
            return 0
        }
    }
    
    
    
    
}
