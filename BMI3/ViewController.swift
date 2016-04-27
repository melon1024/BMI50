//
//  ViewController.swift
//  BMI3
//
//  Created by Myoung-Wan Koo on 2016. 3. 30..
//  Copyright © 2016년 Myoung-Wan Koo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var weight : Double? = 0.0
    var height : Double? = 0.0
    
    var bmi : Double? {
        get{
            if (weight != nil) && (height != nil) {
                return weight!/(height!*height!)
            }
            else{
                return nil
            }
        }
    }
    

    @IBOutlet weak var bmiLabel: UILabel!
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField:UITextField)->Bool
    {
        textField.resignFirstResponder()
        return true
    }

    func updateUI(){
        if let b = self.bmi{
            self.bmiLabel.text = String(format: "%4.1f",b)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        guard let txt: String = textField.text else {
            return
        }
        
        func conv(numString: String) -> Double? {
            let result : Double? = NSNumberFormatter().numberFromString(numString)?.doubleValue
            return result
        }
        
    
        switch(textField){
        case heightTextField:
            self.height = conv(txt)
        case weightTextField:
            self.weight = conv(txt)
        default:
            print(" Something Wrong")
            
        } // end of switch
        updateUI()
        
    }// End  Func
}

