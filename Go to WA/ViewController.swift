//
//  ViewController.swift
//  Go to WA
//
//  Created by Дмитрий on 22.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumberTF: UITextField!
    @IBOutlet weak var WhatsAppLabel: UILabel!
    @IBOutlet weak var TelegaLabel: UILabel!
    
    
    @IBAction func whatsappTapped(_ sender: UIButton) {
    }
    @IBAction func telegramTapped(_ sender: UIButton) {
    }
    @IBAction func clearTapped(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

