//
//  TimeVC.swift
//  AssistCare
//
//  Created by developer91 on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
extension UIView
{
    func draw(index: Int) -> CGPoint{
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let arcWidth: CGFloat = 50
        
        let startAngle: CGFloat = 0
        let endAngle: CGFloat = 2 * CGFloat(M_PI)
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        path.lineWidth = arcWidth
        path.stroke()
        
        let angleDifference: CGFloat = CGFloat(M_PI) / 6
        
        let arcLengthPerGlass = angleDifference
        
        let outlineEndAngle1 = arcLengthPerGlass * CGFloat(index) + startAngle
        
        let outlinePath1 = UIBezierPath(arcCenter: center,
                                        radius: bounds.width/2 - 2.5,
                                        startAngle: startAngle,
                                        endAngle: outlineEndAngle1,
                                        clockwise: true)
        return outlinePath1.currentPoint
    }
    
}

class TimeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //        @@@ code of line
        
        //        let path = UIBezierPath()
        //        path.move(to: CGPoint(x: CGFloat(100.0), y: CGFloat(100.0)))
        //        path.addLine(to: CGPoint(x: CGFloat(200.0), y: CGFloat(200.0)))
        //
        //        let shapeLayer = CAShapeLayer()
        //        shapeLayer.path = path.cgPath
        //        shapeLayer.strokeColor = UIColor.blue.cgColor
        //        shapeLayer.lineWidth = 3.0
        //        shapeLayer.fillColor = UIColor.red.cgColor
        //
        //        self.view.layer.addSublayer(shapeLayer)
        
        /*for i in 1...12
        {
            let point = vwClock.draw(index: i)
            print("\(point) for i \(i)")
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
