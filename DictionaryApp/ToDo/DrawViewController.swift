//
//  DrawViewController.swift
//  ToDo
//
//  Created by ADMIN on 11/5/20.
//

import UIKit

class DrawViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let canvas = Canvas()
        canvas.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(canvas)
        canvas.snp.makeConstraints { (make) in
            make.leading.top.trailing.bottom.equalToSuperview()
        }

    }
    


    
}
@IBDesignable
class Canvas: UIView {
    var xBall = 0
    var yBall = 0

    let shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2
        return shapeLayer
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    func configure() {
        layer.addSublayer(shapeLayer)

        updatePath()
    }

    func updatePath() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 30, y: 30))
        path.addLine(to: CGPoint(x: xBall, y: yBall))
        shapeLayer.path = path.cgPath
    }
}
