//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Wilson Tang on 30/11/2015.
//  Copyright © 2015 Jiffies Code Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var convertedValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.convertedValueLabel.text = "";
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func celsiusToFahrenheitButtonTapped(sender: UIButton) {
        let degreeInCelsius = Double(inputText.text!)
        if let deg = degreeInCelsius {
            let degreeInFahrenheit : Double = deg * 9.0 / 5.0 + 32
            let formetted : String = String(format: "%.2f", degreeInFahrenheit)
            self.convertedValueLabel.text = "\(formetted) degrees Fahrenheit"
        } else {
            showInputErrorAlert()
        }
    }
    
    
    @IBAction func fahrenheitToCelsiusButtonTapped(sender: UIButton) {
        let degreeInFahrenheit = Double(inputText.text!)
        if let deg = degreeInFahrenheit {
            let degreeInCelsius : Double = (deg - 32.0) * 5.0 / 9.0
            let formetted : String = String(format: "%.2f", degreeInCelsius)
            self.convertedValueLabel.text = "\(formetted) degrees Celsius"
        } else {
            showInputErrorAlert()
        }
    }
    
    func showInputErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Invalid Input", preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in }
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        self.inputText.resignFirstResponder()
    }
}

