//
//  ViewController.swift
//  DatePiker
//
//  Created by 장한솔 on 2021/02/01.
//

import UIKit

class DateViewController: UIViewController {
    
    // 타이머가 구동되면 실행되는 함수
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0  // 간격 1초
    var count = 0       // 타이머가 설정한 간격대로 실행되는 지 확인하기 위한 테스트용 변수
    
    @IBOutlet var CurrentTime: UILabel!  // 현재 시간 레이블 아울렛 변수
    @IBOutlet var PikerTime: UILabel!    // 선택 시간 레이블 아울렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender  // 데이터피커로 선택한 인수를 저장
        
        let formatter = DateFormatter() //DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 dateFormat 속성 설정
        PikerTime.text = "선택시간:" + formatter.string(from: datePickerView.date)
        // 데이트피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로
        // strintg 메서드를 사용하여 string으로 변환
        
    }
    @objc func updateTime() {
        // 해당 함수가 제대로 동작하는지 테스트
        // count값을 문자열로 바꿔서 CurrentTime.text로 출력
        // CurrentTime.text = String(count)
        // count = count + 1
        
        let date = NSDate() // 현재 시간을 가져옴
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss eee"
        CurrentTime.text = "현재시간:" + formatter.string(from: date as Date)
        
    }
}

