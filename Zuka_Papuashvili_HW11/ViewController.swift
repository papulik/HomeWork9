//
//  ViewController.swift
//  Zuka_Papuashvili_HW11
//
//  Created by Zuka Papuashvili on 21.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var sumButtonLabel: UILabel!
    
    
    //MARK: array, რომელიც შეინახავს დაგენერირებულ ციფრებს.
    
    var generatedNumber: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    //MARK: switcherAct ცვლის switchLabels იმის მიხედვით თუ რომელი option გვჭირდება.
    
    @IBAction func switcherAct(_ sender: UISwitch) {
        if sender.isOn {
            switchLabel.text = "ყველა მონაცემი შეიყვანეთ."
        } else {
            switchLabel.text = "მინიმუმ ერთი მონაცემი შეავსეთ."
        }
    }
    
    //MARK: ყველა Generate Button აქ არის დაკავშირებული. Slider-ის randomElement-ი იწერება textField-ში და თან გენერირდება და ინახება generatedNumber[Int]-ში.
    
    @IBAction func generate(_ sender: UIButton) {
        if sender.tag == 1 {
            let newNumber = Float.random(in: 1...sliderValue.value)
            textField1.text = String(Int(newNumber))
            if let text = textField1.text, let intValue = Int(text) {
                generatedNumber.append(intValue)
            }
        } else if sender.tag == 2 {
            let newNumber = Float.random(in: 1...sliderValue.value)
            textField2.text = String(Int(newNumber))
            if let text = textField2.text, let intValue = Int(text) {
                generatedNumber.append(intValue)
            }
        } else if sender.tag == 3 {
            let newNumber = Float.random(in: 1...sliderValue.value)
            textField3.text = String(Int(newNumber))
            if let text = textField3.text, let intValue = Int(text) {
                generatedNumber.append(intValue)
            }
        } else if sender.tag == 4 {
            let newNumber = Float.random(in: 1...sliderValue.value)
            textField4.text = String(Int(newNumber))
            if let text = textField4.text, let intValue = Int(text) {
                generatedNumber.append(intValue)
            }
        } else if sender.tag == 5 {
            let newNumber = Float.random(in: 1...sliderValue.value)
            textField5.text = String(Int(newNumber))
            if let text = textField5.text, let intValue = Int(text) {
                generatedNumber.append(intValue)
            }
        }
    }
    
    //MARK: Slider-ი ცვლის Label-ის ტექსტს მისი Value-ს მეშვეობით
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        //დიაპაზონს ვიწყებ 1 - დან, რადგან 0ს გაყოფა ციფრზე არ შეიძლება რის დროსაც აგდებს error: Thread 1: Fatal error: Division by zero ამიტომ ყველგან 1-თ შევცვალე დიაპაზონის საწყისი.
        
        sliderLabel.text = "დიაპაზონი არის 1 - \(Int(sender.value))"
    }
    
    //MARK: Button, რომელიც ახდენს საშუალოს გამოთვლას.
    
    @IBAction func sumButton(_ sender: UIButton) {
        
        if switcher.isOn {
            if textField1.text == "" || textField2.text == "" || textField3.text == "" || textField4.text == "" || textField5.text == "" {
                //რომელიმე მაინც თუ ცარიელია.
                sumButtonLabel.text = "გთხოვთ შეავსოთ ყველა ბმული"
                sumButtonLabel.textColor = .red
            } else {
                //ყველას შევსებულია.
                sumButtonLabel.textColor = .systemGreen
                let sum = generatedNumber.reduce(0, +)
                sumButtonLabel.text = "საშუალო არის: \((sum / generatedNumber.count))"
                generatedNumber.removeAll()
            }
            
        } else if !switcher.isOn {
            if textField1.text == "" && textField2.text == "" && textField3.text == "" && textField4.text == "" && textField5.text == "" {
                // არც-ერთი თუ არ არის შევსებული.
                sumButtonLabel.text = "გთხოვთ შეავსოთ მინიმუმ ერთი ბმული"
                sumButtonLabel.textColor = .red
            } else {
                // ერთი მაინც არის შევსებული.
                sumButtonLabel.textColor = .systemGreen
                let sum = generatedNumber.reduce(0, +)
                sumButtonLabel.text = "საშუალო არის: \((sum / generatedNumber.count))"
                generatedNumber.removeAll()
            }
        }

    }
}
