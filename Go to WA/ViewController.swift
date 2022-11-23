//
//  ViewController.swift
//  Go to WA
//
//  Created by Дмитрий on 22.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var inputNumberTF: UITextField!
    @IBOutlet weak var WhatsAppLabel: UILabel!
    @IBOutlet weak var TelegaLabel: UILabel!
    
    private let maxNumberCount = 11
    private let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
    inputNumberTF.delegate = self
    inputNumberTF.keyboardType = .numberPad
    
    }
        
    
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "7" }
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
        
        
        if number.count > maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
                number = String(number[number.startIndex..<maxIndex])
               }
        
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
                number = String(number[number.startIndex..<maxIndex])
                }
        
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        
        
//        if number.count < 7 {
//            let pattern = "(\\d)(\\d{3})(\\d+)"
//                number = number.replacingOccurrences(of: pattern, with: "$1$2$3", options: .regularExpression, range: regRange)
//            } else {
//                let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
//                    number = number.replacingOccurrences(of: pattern, with: "$1$2$3$4$5", options: .regularExpression, range: regRange)
//                }
        
        return number
        
    }
    
    var numberTF: String = ""
    
    @IBAction func whatsappTapped(_ sender: UIButton) {
        numberTF = inputNumberTF.text ?? ""
//        WhatsAppLabel.text = "Wa.me/\(numberTF)"
        UIApplication.shared.open(URL(string: "https://Wa.me/\(numberTF)")! as URL, options: [:], completionHandler: nil)
        
    }
    @IBAction func telegramTapped(_ sender: UIButton) {
    }
    @IBAction func clearTapped(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        return false
    }
}
