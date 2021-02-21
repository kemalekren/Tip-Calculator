//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Kemal Ekren on 16.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var totalBillAmount: Double = 0.0
    private var totalTipAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipTextField: UITextField!
    
    
    @IBAction func billTextFieldAction(_ sender: Any) {
        
        let tip = Double(tipTextField.text ?? "") ?? 0
        let bill = Double(billTextField.text ?? "") ?? 0
        
        calculateTip(tipAmount: tip, billAmount: bill)
        
    }
    
    @IBAction func tipTextFieldAction(_ sender: Any) {
        
        let tip = Double(tipTextField.text ?? "") ?? 0
        let bill = Double(billTextField.text ?? "") ?? 0
        
        calculateTip(tipAmount: tip, billAmount: bill)
    }
    
    private func calculateTip(tipAmount: Double, billAmount: Double) {
        
        totalBillAmount =  billAmount * (1 + (tipAmount / 100))
        totalTipAmount = totalBillAmount - billAmount
        

        totalAmountLabel.text = "$" + String(format: "%.2f",totalBillAmount)
        tipAmountLabel.text = "$" + String(format: "%.2f",totalTipAmount)
    }
}

extension ViewController {
    func hideKeyboardWhenTappedAround() {
           let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }
       
       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
}

