//
//  LanguageVC.swift
//  Z2
//
//  Created by zed on 11/10/21.
//

import UIKit

class LanguageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn(_ sender: Any) {
    
        let vc = UIStoryboard(name: "Start", bundle: Bundle.main).instantiateViewController(withIdentifier: "start") as? GetStartVC
        vc?.modalPresentationStyle = .fullScreen
        navigationController?.present(vc!, animated: true)
 
    }
    
}
