//
//  ViewController.swift
//  PinchGesture
//
//  Created by 장한솔 on 2021/03/04.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var Pinch: UILabel!
    
    var initialFontSize: CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer)
    {
        if (pinch.state == UIGestureRecognizer.State.began)
        {
            initialFontSize = Pinch.font.pointSize
        }
        else
        {
            Pinch.font = Pinch.font.withSize(initialFontSize * pinch.scale)
        }
    }


}

