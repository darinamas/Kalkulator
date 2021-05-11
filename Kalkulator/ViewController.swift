//
//  ViewController.swift
//  Kalkulator
//
//  Created by Daryna Polevyk on 07/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labelOperation: UILabel!
    @IBOutlet var buttons: [UIButton]!
    var stringNumber = ""
    var firstNumber: Float?
    var secondNumber: Float?
    var operation: Operation?
    var result: Float?
    var countOfClicks: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 7 //button.layer.frame.size.width / 2
            button.layer.borderWidth = 3
            button.layer.borderColor = UIColor.white.cgColor
            button.titleLabel?.font = button.titleLabel?.font.withSize(30)  //title size
            button.setTitleColor(.white, for: .normal) // color of the button title
            button.setTitleColor(.systemPink, for: .highlighted)
        }
    }
    
    @IBAction func buttonTapped(_ sender:UIButton ) {
        
        switch sender.tag {
        case 0,1,2,3,4,5,6,7,8,9:
            stringNumber += String(sender.tag)
            labelOperation.text = stringNumber
            countOfClicks = 0
            
        case 10,11,12,13:
            
            countOfClicks += 1
            
            if countOfClicks == 1 {
                guard let labelText = labelOperation.text else {return}
                guard let floatLabelText = Float(labelText) else {return}
                
                firstNumber = floatLabelText
                labelOperation.text = ""
            }
            
            switch sender.tag {
            case 10: operation = .sum
            case 11: operation = .sub
            case  12 : operation = .mult
            case 13: operation = .div
            default: break
                
            }
            
            stringNumber = ""
            
        case 14:
            
            guard let labelText = labelOperation.text else {return}
            guard let floatLabelText = Float(labelText) else {return}
            secondNumber = floatLabelText
            
            guard let operation = operation else {return}
            
            guard let sn = secondNumber else {return}
            guard let fn = firstNumber else {return}
            
            switch operation {
            case .sum: result = sn + fn
            case .div: result = fn / sn
            case .mult : result = fn * sn
            case .sub: result = fn - sn
            }
            
            guard let result = result else {return}
            let array = String(result).split(separator: ".")
            if array[1] == "0" {
                
                labelOperation.text = String(array[0])
            } else {
                labelOperation.text = String(result)
            }
            
            
            stringNumber = ""
            firstNumber = nil
            secondNumber = nil
            countOfClicks = 0
            
            
        default:
            break
            
            
            
            
        }
        
        
        
        
    }
}

enum Operation {
    
    case div, mult, sum, sub
}
