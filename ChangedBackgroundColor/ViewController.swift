//
//  ViewController.swift
//  ChangedBackgroundColor
//
//  Created by ryosuke kubo on 2018/11/09.
//  Copyright © 2018 ryosuke kubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redStack = Stack(color: Stack.Color.red, position: CGPoint(x: 0, y: 200))
    let greenStack = Stack(color: Stack.Color.green, position: CGPoint(x: 0, y: UIScreen.main.bounds.midY))
    let blueStack = Stack(color: Stack.Color.blue, position: CGPoint(x: 0, y: UIScreen.main.bounds.maxY - 200))


    override func viewDidLoad() {
        super.viewDidLoad()
        redStack.slider.addTarget(self, action: #selector(self.redStackVlueChanged(_:)), for: .valueChanged)
        greenStack.slider.addTarget(self, action: #selector(self.greenStackVlueChanged(_:)), for: .valueChanged)
        blueStack.slider.addTarget(self, action: #selector(self.blueStackVlueChanged(_:)), for: .valueChanged)
        view.addSubview(redStack.stack)
        view.addSubview(greenStack.stack)
        view.addSubview(blueStack.stack)
    }
    
    @objc func redStackVlueChanged (_ sender: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(sender.value) / 255.0, green: CGFloat(greenStack.slider.value) / 255, blue: CGFloat(blueStack.slider.value) / 255, alpha: 1)
        print(view.backgroundColor ?? "")
    }
    
    @objc func greenStackVlueChanged (_ sender: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(redStack.slider.value) / 255, green: CGFloat(sender.value) / 255, blue: CGFloat(blueStack.slider.value) / 255, alpha: 1)
            print(view.backgroundColor ?? "")
    }
    
    @objc func blueStackVlueChanged (_ sender: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(redStack.slider.value) / 255, green: CGFloat(greenStack.slider.value) / 255, blue: CGFloat(sender.value) / 255, alpha: 1)
            print(view.backgroundColor ?? "")
    }

}

struct Stack {
    enum Color {
        case red
        case green
        case blue
    }
    var label = UILabel()
    var slider = UISlider()
    var stack = UIStackView()
    
    init(color: Stack.Color, position: CGPoint) {
        stack.frame = CGRect(origin: position , size: CGSize(width: 200, height: 300))
        stack.center = CGPoint(x: UIScreen.main.bounds.midX, y: position.y)
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        switch  color{
        case .red:
            label.text = "Red"
        case .green:
            label.text = "Green"
        case .blue:
            label.text = "Blue"
        }
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        
        slider.minimumValue = 0
        slider.maximumValue = 250
        slider.value = 0
        //slider.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(slider)
        
    }
    
}



