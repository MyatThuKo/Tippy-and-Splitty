//
//  ViewController.swift
//  Tippy and Splitty
//
//  Created by Myat Thu Ko on 11/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UITextField!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfPeopleLabel.text = String(defaults.integer(forKey: "numOfPeople"))
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipPercent")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear.")
        defaults.set(2, forKey: "tipPercent")
        defaults.set(1, forKey: "numOfPeople")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear.")
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
        
        tipAmount.text = String(format: "$%.2f", tip)
        
        totalAmount.text = String(format: "$%.2f", total)
        
        totalPerPerson.text = String(format: "$%.2f", total / Double(numberOfPeople))
    }
    
}

