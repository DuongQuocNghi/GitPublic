//
//  ViewController.swift
//  IOSD005-260419
//
//  Created by ADMIN on 4/26/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var redView:UIView!
    var orangeView:UIView!
    var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpRedView()
        setUpOrangeView()
        view.setNeedsUpdateConstraints()
    }

    func setUpRedView() {
        redView = UIView()
        redView.backgroundColor = UIColor.red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
    }

    func setUpOrangeView() {
        orangeView = UIView()
        orangeView.backgroundColor = UIColor.orange
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(orangeView)    }
    
    override func updateViewConstraints() {
        if(!didSetupConstraints){
            let redViewConstraints = [
                NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100),
                NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 200),
                NSLayoutConstraint(item: redView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: redView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
            ]
            NSLayoutConstraint.activate(redViewConstraints)
            
            let orangeViewConstraints = [
                NSLayoutConstraint(item: orangeView, attribute: .width, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .width, multiplier: 1/2, constant: 0),
                NSLayoutConstraint(item: orangeView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 100),
                NSLayoutConstraint(item: orangeView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: orangeView, attribute: .right, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 0)
            ]
            NSLayoutConstraint.activate(orangeViewConstraints)
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
}

