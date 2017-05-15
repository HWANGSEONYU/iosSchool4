//
//  ViewController.swift
//  Calculation
//
//  Created by celia me on 2017. 5. 10..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var displayLB: UILabel!

    var tempFirstNum:Int = 0
    var tempSecondNum:Int = 0
    
    //var tempOperation:String?
    var tempOperation:String = ""
    
    var displayNum:String = ""

    ////////////////View Lifecycle/////////////////
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    ////////////////View Action/////////////////
    // MARK: - View Action
    @IBAction func clickNumBtn7(_ sender: UIButton) {
        displayNum += "7"
        /*
        if tempOperation.isEmpty {
            
            // 옵셔널!의 의미: 이건 nil이 아니다
            // 형변환에 실패하면 nil을 반환
            //self 생략 가능
            tempFirstNum = Int(displayNum)!
        } else {
            tempSecondNum = Int(displayNum)!
        }
        
        self.displayLB.text = displayNum
        */
        displayNumLB()
    }
    @IBAction func clickNumBtn8(_ sender: UIButton) {
/*
        let displayingText:String = self.displayLB.text!
        self.displayLB.text = displayingText + "8"
*/
        displayNum += "8"
        displayNumLB()
    }
    
    @IBAction func clickNumBtn(_ sender: UIButton) {
        displayNum += (sender.titleLabel?.text)!
        displayNumLB()
    }
    @IBAction func touchUpInsideOperationBtn(_ sender:UIButton) {
        switch sender.currentTitle! {
        case "+":
            tempOperation = "+"
        case "-":
            tempOperation = "-"
        case "×":
            tempOperation = "*"
        case "÷":
            tempOperation = "/"
        default:
            tempOperation = ""
        }
        displayNum = ""
    }
    
    @IBAction func touchUpInsideResultBtn(_ sender: UIButton) {
        var resultValue = 0
        
        switch tempOperation {
        case "+":
            resultValue = plus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "-":
            resultValue = minus(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "*":
            resultValue = multiply(firstNum: tempFirstNum, secondNum: tempSecondNum)
        case "/":
            resultValue = divide(firstNum: tempFirstNum, secondNum: tempSecondNum)
        default:
            resultValue = 0
        }
        self.displayLB.text = "\(resultValue)"
        
        initTempVal()

    }
    @IBAction func touchUpInsideACBtn(_ sender: UIButton) {
        initTempVal()
        self.displayLB.text = displayNum
    }

    
    ////////////////Method/////////////////
    // MARK: - Method
    func plus(firstNum:Int, secondNum:Int) ->Int {
        return firstNum + secondNum
    }
    func minus(firstNum:Int, secondNum:Int) ->Int {
        return firstNum - secondNum
    }
    func multiply(firstNum:Int, secondNum:Int) ->Int {
        return firstNum * secondNum
    }
    func divide(firstNum:Int, secondNum:Int) ->Int {
        return firstNum / secondNum
    }
    func displayNumLB(){
        if tempOperation.isEmpty {
            tempFirstNum = Int(displayNum)!
        } else {
            tempSecondNum = Int(displayNum)!
        }
        
        self.displayLB.text = displayNum
    }
    func initTempVal(){
        tempFirstNum = 0
        tempSecondNum = 0
        tempOperation = ""
        
        displayNum = ""
    }

}

