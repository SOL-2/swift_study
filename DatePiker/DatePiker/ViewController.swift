//
//  ViewController.swift
//  DatePiker
//
//  Created by 장한솔 on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var CurrentTime: UILabel!
    @IBOutlet var PikerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        PikerTime.text = "선택시간:" + formatter.string(from: datePickerView.date)
        
    }
    @objc func updateTime() {
//        제대로 동작하는지 테스트
//        CurrentTime.text = String(count)
//        count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss eee"
        CurrentTime.text = "현재시간:" + formatter.string(from: date as Date)
        
    }
}

