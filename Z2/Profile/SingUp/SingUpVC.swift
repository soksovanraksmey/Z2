//
//  SingUpVC.swift
//  Z2
//
//  Created by Zed on 18/11/21.
//

import UIKit
import MaterialComponents



class SingUpVC: UIViewController {

    @IBOutlet weak var btnContinue: UIButton!
    
//    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var tfPhone: MDCOutlinedTextField!
    
    
//    var textController: MDCTextInputControllerOutlined!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldSetup()
         
    }
    
    func textFieldSetup(){
//        textView.leftViewMode = .always
//
//        let imageView1 = UIImageView()
//        let image1 = UIImage(named: "kh-lang")
//        imageView1.image = image1
//
//        imageView1.frame = CGRect(x: 10, y: 5 , width: textView.frame.height, height: textView.frame.height)
//        textView.leftView = imageView1
        
        tfPhone.placeholder = "phone"
        tfPhone.label.text = "Phone"
        tfPhone.leadingAssistiveLabel.text = "error plz input phone.."
//        tfPhone.l...........
        
    
    }
    
    @IBAction func btnContinue(_ sender: Any) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileSingUp")
        navigationController?.pushViewController(vc!, animated: true)
    
    
    
    }
    
    
    
}
