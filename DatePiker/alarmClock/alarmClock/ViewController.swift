//
//  ViewController.swift
//  alarmClock
//
//  Created by 장한솔 on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {
    
    // timeselector 선언 : viewcontroller.updatetime의 함수를 selector에 저장
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0  // interval은 1초씩
    var count = 0       // count 변수 선언
    
    @IBOutlet var CurrentTime: UILabel!  // 현재시간을 나타내는 아울렛 변수
    @IBOutlet var PickerTime: UILabel!   // 선택시간을 나탸내는 아울렛 변수
    
    // override : 부모클래스 재정의
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Timer.scheduledTimer는 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
   
    }

    // datePicker는 값이 변경될 때마다 함수가 작동 (콜백함수)
    @IBAction func ChangeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender // DatePicker의 변경한 값을 datePickerView에 저장
        
        let formatter = DateFormatter() // DateFormatter라는 객체를 선언(이름 formatter, 상수형)
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        PickerTime.text = "선택시간:" + formatter.string(from: datePickerView.date)
        
        
        
    }
    
    // 위의 Action 함수처럼 콜백함수가 아님
    // objectC 함수 사용 -> updateTime 함수를 timeSelector에서 호출
    // timeSelector를 Timer에서 호출
    @objc func updateTime() {
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        
        CurrentTime.text = "현재시간:" + formatter.string(from: date as Date)
    }
    
    
}

