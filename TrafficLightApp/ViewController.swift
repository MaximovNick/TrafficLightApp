//
//  ViewController.swift
//  TrafficLightApp
//
//  Created by Nikolai Maksimov on 11.06.2022.
//

import UIKit

enum Color {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    var currentColor = Color.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        setupAlphaForViews()
        
        setupCornerRadiusForViews()
    }
    
    @IBAction func changeColorButtonPressed() {
        
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentColor {
            
        case .red:
            greenView.alpha = lightIsOff
            redView.alpha = lightIsOn
            currentColor = .yellow
        case .yellow:
            redView.alpha = lightIsOff
            yellowView.alpha = lightIsOn
            currentColor = .green
        case .green:
            yellowView.alpha = lightIsOff
            greenView.alpha = lightIsOn
            currentColor = .red
        }
    }
    
    private func setupCornerRadiusForViews() {
        redView.layer.cornerRadius = redView.frame.height / 2
        yellowView.layer.cornerRadius = yellowView.frame.height / 2
        greenView.layer.cornerRadius = greenView.frame.height / 2
    }
    
    private func setupAlphaForViews() {
        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
    }
}

