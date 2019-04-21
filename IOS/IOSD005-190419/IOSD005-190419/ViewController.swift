//
//  ViewController.swift
//  IOSD005-190419
//
//  Created by ADMIN on 4/19/19.
//  Copyright © 2019 ADMIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var constraintRightViewOri: NSLayoutConstraint!
    @IBOutlet weak var constraintTopViewOri: NSLayoutConstraint!
    @IBOutlet weak var viewOri: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let lable = UILabel()
        lable.text = "iOS"
        lable.textColor = UIColor.red
        lable.font = UIFont.boldSystemFont(ofSize: 30)
        lable.sizeToFit()
        lable.center = view.center
        view.addSubview(lable)
        
        let  greenView = UIView(frame: CGRect(x:20,y:20,width:50,height:50))
        greenView.backgroundColor = UIColor.green
        view.addSubview(greenView)
        
        constraintTopViewOri = viewOri.co
        
    }


}

