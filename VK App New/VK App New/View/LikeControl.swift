//
//  LikeControl.swift
//  VK App New
//
//  Created by Екатерина on 09/11/2019.
//  Copyright © 2019 noni. All rights reserved.
//

import UIKit
@IBDesignable
class LikeControl: UIControl {
   @IBInspectable var isLiked: Bool = false

    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        let heartPath = UIBezierPath()
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
             
        heartPath.addArc(withCenter: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)

        heartPath.addLine(to: CGPoint(x: rect.width/2, y: rect.height * 0.2))

        heartPath.addArc(withCenter: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)

        heartPath.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))
             
        heartPath.close()
        UIColor.red.setStroke()
        heartPath.stroke()
        UIColor.red.setFill()
        
        if isLiked {
            heartPath.stroke()
        } else {
            heartPath.fill()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        let doubleTapGR = UITapGestureRecognizer(target: self, action: #selector(tapped))
        doubleTapGR.numberOfTouchesRequired = 1
        addGestureRecognizer(doubleTapGR)
    }
    @objc private func tapped(_ tapGesture: UITapGestureRecognizer){
        isLiked.toggle()
        self.setNeedsDisplay()
        sendActions(for: .valueChanged)
    }
}
