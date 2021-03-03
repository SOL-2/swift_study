//
//  ViewController.swift
//  TapTouch
//
//  Created by 장한솔 on 2021/03/03.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var Message: UILabel!
    @IBOutlet var TapCount: UILabel!
    @IBOutlet var TouchCount: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first! as UITouch
        
        Message.text = "Touches Began"
        TapCount.text = String(touch.tapCount)
        TouchCount.text = String(touches.count)
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first! as UITouch
        
        Message.text = "Touches Moved"
        TapCount.text = String(touch.tapCount)
        TouchCount.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first! as UITouch
        
        Message.text = "Touches Ended"
        TapCount.text = String(touch.tapCount)
        TouchCount.text = String(touches.count)
        
    }
}

