//
//  ViewController.swift
//  Helloworld
//
//  Created by 장한솔 on 2021/01/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text!
    }
    
}


//문법 체크
//
//IB : Interface Builder에 관련된 변수나 함수라는 것
//
//@IBOutlet : 객체를 소스 코드에서 참조하기 위해 사용하는 키워드
//주로 색상, 크기, 모양, 선의 두께, 텍스트 내용 등 객체의 속성을 제어하는 데 사용
//
//var 변수이름 : 변수를 선언할 때는 var 키워드 사용
//변수를 선언하는 var 뒤에 아웃렛변수의 이름 lblHello를 입력하여 변수 선언
//
//UILabel! : 선언하고자 하는 변수의 타입을 나타냄
//위 예제에서는 레이블 객체에 대한 변수 선언하며 클래스 타입을 선택
//여기서 UI는 User Interface 의미
//
//strong/weak : 아웃렛 변수를 추가할 때 나타나는 팝업 창의 Storage라는 항목에서 선택 가능
//-> 메모리 회수를 나타내는 키워드
//객체를 참조하기 위한 아웃렛 변수는 strong 사용
//weak로 선언하면 변수 앞에 weak 추가
//
//strong으로 선언된 변수는 다른 곳에서 참조하고 있을 경우 메모리에서 제거되지 않지만
//weak로 선언된 변수는 다른 곳에서 참조하고 있더라도 시스템이 임의적으로 메모리에서 제거할 수 있음
//
//@IBAction : 객체의 이벤트를 제어하기 위해 사용하는 키워드
//
//func 함수이름 : 함수를 선언할 때는 func 키워드 사용
//
//(_ sender: UIButton): 액션 함수가 실행되도록 이벤트를 보내는 객체
//-> UIButton 클래스 타입을 선택함
//
//lblHello.text : 레이블 객체가 가지고 있는 속성 중 텍스트 내용을 의미하는 속성
//
//txtName.text!: 텍스트필드 객체가 가지고 있는 속성 중 텍스트 내용을 의미하는 속성
//끝에 붙는 !는 옵셔널 변수의 강제 언래핑 의미
