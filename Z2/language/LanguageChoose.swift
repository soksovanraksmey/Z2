//
//  LanguageChoose.swift
//  Z2
//
//  Created by zed on 11/10/21.
//

import UIKit

class LanguageChoose: UIViewController {

    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func choose(_ sender: Any) {
   
        let vc = UIStoryboard(name: "Start", bundle: Bundle.main).instantiateViewController(withIdentifier: "start")
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    
    
    
    }
    
    
}
   
