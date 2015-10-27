//
//  ViewController.swift
//  simpleCalc(iOS)
//
//  Created by seowoosuk on 10/22/15.
//  Copyright © 2015 Woosuk Seo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UITextField!
    
    var userEnteringNum = false
    var currentNum = ""
    var result = Double()
    var numbers = [Double]()
    var operation = ""
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnNum(sender: UIButton) {
        let num = sender.titleLabel!.text
        
        if userEnteringNum {
            display.text = display.text! + num!
            currentNum += num!
        } else {
            display.text = num
            userEnteringNum = true
            currentNum += num!
        }
    }
    
    @IBAction func btnSimpleOp(sender: UIButton) {
        if userEnteringNum {
            let numDouble = NSNumberFormatter().numberFromString(currentNum)?.doubleValue
            numbers.append(numDouble!)
            operation = sender.titleLabel!.text!
            display.text = display.text! + operation
            currentNum = ""
        } else {
            print("Type number first")
        }
    }
    
    @IBAction func btnExtraOp(sender: UIButton) {
        if userEnteringNum {
            let numDouble = NSNumberFormatter().numberFromString(currentNum)?.doubleValue
            numbers.append(numDouble!)
            operation = sender.titleLabel!.text!
            display.text = display.text! + operation
            currentNum = ""
        } else {
            print("Type number first")
        }
    
    }
    
    @IBAction func btnFact(sender: UIButton) {
        if userEnteringNum {
            let numInt = NSNumberFormatter().numberFromString(currentNum)?.integerValue
            
            operation = sender.titleLabel!.text!
            display.text = display.text! + operation
            result = Double(calcFact(numInt!))
            display.text = "\(result)"
            
            userEnteringNum = false
            numbers.removeAll()
            currentNum=""
        } else {
            print("Type an interger first")
        }
    }
    
    var displayvalue : Double {
        get {
            return (NSNumberFormatter().numberFromString(display.text!)?.doubleValue)!
        } set {
            display.text = "\(newValue)"
            userEnteringNum = false
        }
    }
    
    @IBAction func btnCleaer(sender: UIButton) {
        displayvalue = 0
        display.text = "\(Int(displayvalue))"
        numbers.removeAll()
        userEnteringNum = false
    }
    
    @IBAction func btnEqualTo(sender: UIButton) {
        let numDouble = NSNumberFormatter().numberFromString(currentNum)?.doubleValue

        userEnteringNum = false
        numbers.append(numDouble!)
        operate(numbers[0],oper:operation, num2:numbers[1])
        display.text = "\(result)"
        numbers.removeAll()
        currentNum=""
        
    }
    
    func operate(num1:Double,oper:String,num2:Double) -> Void {
        
        let num1 = Double(num1)
        let num2 = Double(num2)
        
        switch oper {
        case "+":
            result = num1+num2
        case "-":
            result = num1-num2
        case "÷":
            result = num1/num2
        case "x":
            result = num1*num2
        case "MOD":
            result = num1%num2
        case "AVG":
            result = calcAvg(numbers)
        case "CNT":
            result = Double(numbers.count)
        default:
            break
        }
    }
    
    func calcAvg(values : [Double])->Double{
        var total = 0.0
        for value in values {
            total += Double(value)
        }
        return total/Double(values.count)
    }
    
    func calcFact(value : Int) -> Int {
        var fact = 1
        var num = value
        while(num != 0) {
            fact *= num
            num--
        }
        return fact
    }
    
}

