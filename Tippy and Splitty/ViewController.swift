//
//  ViewController.swift
//  Tippy and Splitty
//
//  Created by Myat Thu Ko on 11/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmount.text!) ?? 0
        
        let tipPercentages = [0.15,0.18,0.20,0.25]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let numberOfPeople = Int(numberOfPeopleLabel.text!) ?? 1
        
        tipPercentage.text = String(format: "$%.2f", tip)
        
        totalAmount.text = String(format: "$%.2f", total)
        
        totalPerPerson.text = String(format: "$%.2f", total / Double(numberOfPeople))
    }
    
}

