//
//  LanguageVC.swift
//  Z2
//
//  Created by zed on 11/10/21.
//

import UIKit

class LanguageVC: UIViewController {

    @IBOutlet var btnContinue: UIButton!
    @IBOutlet var tableView: UITableView!
    
    let imageFlag = ["kh-lang","en-lang"]
    let language = ["ខ្មែរ","English"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CheckMarkTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CheckMarkTableViewCell")
        
        btnContinue.layer.cornerRadius = 7
        
        
        
        
    }
    

    @IBAction func btn(_ sender: Any) {
    
        let vc = UIStoryboard(name: "Start", bundle: Bundle.main).instantiateViewController(withIdentifier: "start") as? GetStartVC
        vc?.modalPresentationStyle = .fullScreen
        navigationController?.present(vc!, animated: true)
 
    }
    
}

extension LanguageVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageFlag.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckMarkTableViewCell", for: indexPath) as! CheckMarkTableViewCell
        cell.imageFlag.image = UIImage(named: imageFlag[indexPath.row])
        cell.nameContry.text = language[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CheckMarkTableViewCell else {
               return
        }
        if cell.tbnCheck.contains(indexPath as! UIFocusEnvironment){
            
            cell.tbnCheck.isHidden = false
            
        }else {
            cell.tbnCheck.isHidden = true
        }
            
            
        print("check")

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
}
