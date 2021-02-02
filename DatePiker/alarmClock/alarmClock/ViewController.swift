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
    
//    let sixtyCount: Selector = #selector(ViewController.countSeconds)
//    let countInterval = 1.0
//    var countNum = 0
    
    var alarmTime: String = ""
    var CurrentOnlyTime: String = ""
    

    @IBOutlet var CurrentTime: UILabel!  // 현재시간을 나타내는 아울렛 변수
    @IBOutlet var PickerTime: UILabel!   // 선택시간을 나탸내는 아울렛 변수
    
    // override : 부모클래스 재정의
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Timer.scheduledTimer는 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
//        Timer.scheduledTimer(timeInterval: countInterval, target: self, selector: sixtyCount, userInfo: nil, repeats: true)
   
    }

    // datePicker는 값이 변경될 때마다 함수가 작동 (콜백함수)
    @IBAction func ChangeDatePicker(_ sender: UIDatePicker)
    {
        
        let datePickerView = sender // DatePicker의 변경한 값을 datePickerView에 저장
        
        let formatter = DateFormatter() // DateFormatter라는 객체를 선언(이름 formatter, 상수형)
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        PickerTime.text = "선택시간:" + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        
        if (alarmTime == CurrentOnlyTime)
        {
            view.backgroundColor = UIColor.red
            
        }
        
    }
    
    
    
    // 위의 Action 함수처럼 콜백함수가 아님
    // objectC 함수 사용 -> updateTime 함수를 timeSelector에서 호출
    // timeSelector를 Timer에서 호출
    
    
//    내가 작성한 부분
    @objc func updateTime() {

        let date = NSDate()
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        CurrentTime.text = "현재시간:" + formatter.string(from: date as Date)


        formatter.dateFormat = "hh:mm aaa"
        CurrentOnlyTime = formatter.string(from: date as Date)



        if (alarmTime == CurrentOnlyTime)
        {
            view.backgroundColor = UIColor.red
        }


        if (view.backgroundColor == UIColor.red)
        {
            count += 1
            print("count : " , count)
        }


            if (count > 60)
            {
                view.backgroundColor = UIColor.white
                count = 0
            }

    }
    
    
    
    
    
//    boolean 사용하여 작성했을 때(스위치처럼 전환되는 모습)
    
//    var isRedOn:Bool=false  // boolean 변수 사용
//
//    @objc func updateTime_ryoni() {
//
//        let date = NSDate()
//        let formatter = DateFormatter()
//
//        formatter.dateFormat = "yyyy-MM-dd HH:mm"
//        CurrentTime.text = "현재시간:" + formatter.string(from: date as Date)
//
//
//        formatter.dateFormat = "hh:mm aaa"
//        CurrentOnlyTime = formatter.string(from: date as Date)
//
//        //빨간색이 켜졌을때 (흰색이 꺼졌을때)
//        if(isRedOn==true)
//        {
//            count += 1
//            print("count : " , count)
//            if (count > 60)
//            {
//                view.backgroundColor = UIColor.white
//                isRedOn=false
//                count = 0
//            }
//
//        }
//
//        //빨간색이 꺼졌을때 처리(흰색일때)
//        else
//        {
//            if (alarmTime == CurrentOnlyTime)
//            {
//                view.backgroundColor = UIColor.red
//                isRedOn=true
//            }
//
//        }
//
//    }
    
    
    
    
}

