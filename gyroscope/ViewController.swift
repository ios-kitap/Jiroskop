//
//  ViewController.swift
//  gyroscope
//
//  Created by Emre Erol on 18.03.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var xField: UITextField!
    @IBOutlet weak var yField: UITextField!
    @IBOutlet weak var zField: UITextField!
    
    var motion = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gyro()
    }
    
    func gyro() {
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            print(data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.rotationRate.x
                let y = trueData.rotationRate.y
                let z = trueData.rotationRate.z
                self.xField.text = "x: \(Double(x).rounded(toPlaces: 3))"
                self.yField.text = "y: \(Double(y).rounded(toPlaces: 3))"
                self.zField.text = "z: \(Double(z).rounded(toPlaces: 3))"

            }
        }
    }

}

extension Double{
    func rounded(toPlaces places:Int)->Double {
        let divs = pow(10.0,Double(places))
        return (self * divs).rounded() / divs
    }
}

