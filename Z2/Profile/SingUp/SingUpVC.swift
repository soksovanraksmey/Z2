//
//  SingUpVC.swift
//  Z2
//
//  Created by Zed on 18/11/21.
//

import UIKit
import MaterialComponents



class SingUpVC: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var btnContinue: UIButton!
    
//    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var tfPhone: MDCOutlinedTextField!
    
    
//    var textController: MDCTextInputControllerOutlined!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        
        textFieldSetup()
        btnContinue.layer.cornerRadius = 5
        tfPhone.delegate = self
        tfPhone.keyboardType = .phonePad
       
//        if tfPhone.text?.isEmpty == true{
//
//            btnContinue.backgroundColor = .systemTeal
//        }else if tfPhone.text?.isEmpty != true{
//            btnContinue.backgroundColor = .lightGray
//        }
        
    
        
    }
    
  
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let numberChar = "+1234567890"
        let numberCharSet = CharacterSet(charactersIn: numberChar)
        let typeCharType = CharacterSet(charactersIn: string)
        return numberCharSet.isSuperset(of: typeCharType)
    }
    
    
    func textFieldSetup(){

        tfPhone.placeholder = "phone number"
        tfPhone.label.text = "Phone"
    
    
    }
    
    @IBAction func btnContinue(_ sender: Any) {
    
        if tfPhone.text != ""  {
            
            UserDefaults.standard.set(true, forKey: "login")
            formatPhoneNumber(phoneNumber: tfPhone.text!)
            
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileSingUp")
            navigationController?.pushViewController(vc!, animated: true)
            print("ready save ")
//            print(error?.localizedDescription)
        }else if tfPhone.text == ""{
            
            let alert = UIAlertController(title: "Confirm", message: "Please input your phone number to continue", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: .none)
            alert.addAction(ok)
            present(alert, animated: true)
        }

    }
    
    func formatPhoneNumber(phoneNumber: String, shouldRemoveLastDigit: Bool = false) -> String {
        guard !phoneNumber.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: r, withTemplate: "")

        if number.count > 10 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 10)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }

        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }

        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d+)", with: "($1) $2", options: .regularExpression, range: range)

        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
        }

        return number
    }
    
    
}

