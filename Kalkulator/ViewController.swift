//
//  ViewController.swift
//  Kalkulator
//
//  Created by Daryna Polevyk on 07/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
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


}

