//
//  ViewController.swift
//  PinchGesture
//
//  Created by 장한솔 on 2021/03/04.
//

import UIKit

class ViewController: UIViewController
{
//    @IBOutlet var Pinch: UILabel!
    
    @IBOutlet var imgPinch: UIImageView!
    
    var initialFontSize: CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    
// 텍스트 핀치
//    @objc func doPinch(_ pinch: UIPinchGestureRecognizer)
//    {
//        if (pinch.state == UIGestureRecognizer.State.began)
//        {
//            initialFontSize = Pinch.font.pointSize
//        }
//        else
//        {
//            Pinch.font = Pinch.font.withSize(initialFontSize * pinch.scale)
//        }
//    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer)
    {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }


}

