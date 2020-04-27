//
//  ViewController.swift
//  trafficLightApp
//
//  Created by MacBook on 27/04/2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redViewOutlet: UIView!
    @IBOutlet var yellowViewOutlet: UIView!
    @IBOutlet var greenViewOutlet: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    
    private let lightIsOff: CGFloat = 0.3
    private let lightIsOn: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 15
        
        redViewOutlet.alpha = lightIsOff
        yellowViewOutlet.alpha = lightIsOff
        greenViewOutlet.alpha = lightIsOff
        
    }

    override func viewWillLayoutSubviews() {
        redViewOutlet.layer.cornerRadius = redViewOutlet.frame.width / 2
        yellowViewOutlet.layer.cornerRadius = yellowViewOutlet.frame.width / 2
        greenViewOutlet.layer.cornerRadius = greenViewOutlet.frame.width / 2
    }

    @IBAction func startButtonPressed() {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            greenViewOutlet.alpha = lightIsOff
            redViewOutlet.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redViewOutlet.alpha = lightIsOff
            yellowViewOutlet.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenViewOutlet.alpha = lightIsOn
            yellowViewOutlet.alpha = lightIsOff
            currentLight = .red
        }
        
    }
    
}

