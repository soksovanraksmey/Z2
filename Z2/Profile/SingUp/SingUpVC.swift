//
//  SingUpVC.swift
//  Z2
//
//  Created by Zed on 18/11/21.
//

import UIKit
//import MaterialComponents



class SingUpVC: UIViewController {


    @IBOutlet weak var textView: UITextField!
    
    
//    var textController: MDCTextInputControllerOutlined!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldSetup()
        
//        let floatingTextfield = MDCTextField(frame: CGRect(x: 0, y: 20, width: self.view.frame.width - 50, height: 50))
//        floatingTextfield.placeholder = "put your phone number"
//        floatingTextfield.center = self.view.center
//
//        self.view.addSubview(floatingTextfield)
//
//
//        self.textController = MDCTextInputControllerOutlined(textInput: floatingTextfield)
//        self.textController.textInsets(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    func textFieldSetup(){
        textView.leftViewMode = .always
       
        let imageView1 = UIImageView()
        let image1 = UIImage(named: "kh-lang")
        imageView1.image = image1
        
        imageView1.frame = CGRect(x: 10, y: 5 , width: textView.frame.height, height: textView.frame.height)
        textView.leftView = imageView1
    
    }
    
    @IBAction func btnContinue(_ sender: Any) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileSingUp")
        navigationController?.pushViewController(vc!, animated: true)
    
    
    
    }
    
    
    
}
