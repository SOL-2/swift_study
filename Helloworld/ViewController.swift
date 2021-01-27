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


문법 체크
IB : Interface Builder에 관련된 변수나 함수라는 것
@IBOutlet : 객체를 소스 코드에서 참조하기 위해 사용하는 키워드
주로 색상, 크기, 모양
