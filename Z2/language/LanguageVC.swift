//
//  LanguageVC.swift
//  Z2
//
//  Created by zed on 11/10/21.
//

import UIKit

struct Language {
    let title: String
    let flag: String
    var isCheck: Bool
}

class LanguageVC: UIViewController {

    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var tableView: UITableView!
    
//    let imageFlag = ["kh-lang","en-lang"]
//    let language = ["ខ្មែរ","English"]
    
    var languages = [
        Language(title: "ខ្មែរ", flag: "kh-lang", isCheck: true),
        Language(title: "English", flag: "en-lang", isCheck: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "home") == true {
            
//            let vc = UIStoryboard(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "home") as! HomeMainViewTableVC
            
//            self.navigationController?.pushViewController(vc, animated: false)

            let vc = UIStoryboard(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "home")
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
      
        }
        

        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CheckMarkTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CheckMarkTableViewCell")
        
        btnContinue.layer.cornerRadius = 7
        
        // check short syntax for check lenguage
//        let selectedLanguage = languages.first(where: {$0.isCheck})
        
        
    }
    

    @IBAction func btn(_ sender: Any) {
    
//        let vc = UIStoryboard(name: "Start", bundle: Bundle.main).instantiateViewController(withIdentifier: "start") as? GetStartVC
//        vc?.modalPresentationStyle = .fullScreen
//        navigationController?.present(vc!, animated: true)

        let vc = UIStoryboard(name: "Start", bundle: Bundle.main).instantiateViewController(withIdentifier: "start")
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
  
       
 
    }
    
}

extension LanguageVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckMarkTableViewCell", for: indexPath) as! CheckMarkTableViewCell
//        cell.imageFlag.image = UIImage(named: language.flag)
//        cell.nameContry.text = language.title
        cell.bindData(langugae: languages[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for (index, _) in languages.enumerated() {
            languages[index].isCheck = false
        }
        
        languages[indexPath.row].isCheck = true
        tableView.reloadData()
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
//         let cell = tableView.cellForRow(at: indexPath) as! CheckMarkTableViewCell
//
//        if cell.isCheck == false {
//
//            cell.isCheck = true
//            cell.tbnCheck.setImage(UIImage(named: "active-tick-square"), for: .normal)
//            print("1")
//
//        }else{
//            cell.isCheck = false
//            cell.tbnCheck.setImage(UIImage(named: ""), for: .normal)
//            print("2")
//        }
       
        
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? CheckMarkTableViewCell else {
//                   return
//               }
//
//        cell.tbnCheck.setImage(UIImage(named: ""), for: .normal)
//        print("3")
//    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
}
//if self.selectedRows.contains(indexPath) {
//            self.selectedRows.remove(at: self.selectedRows.index(of: indexPath)!)
//            cell.checkBox.setImage(UIImage(named:"uncheck.png"), for: .normal)
//        } else {
//            self.selectedRows.append(indexPath)
//            cell.checkBox.setImage(UIImage(named:"check.png"), for: .normal)
//
//            let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
//            let currentCell = tableView.cellForRow(at: indexPath!) as! MyCustomCell
//            print(currentCell.myCellLabel.text ?? "")
//        }
