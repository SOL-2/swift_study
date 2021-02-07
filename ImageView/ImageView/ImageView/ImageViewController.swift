//
//  ViewController.swift
//  ImageView
//
//  Created by 장한솔 on 2021/01/28.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false
    // 확대 여부를 나타내는 bool 타입의 변수
    var imgOn: UIImage?
    // 켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff: UIImage?
    // 꺼진 전구 이미지가 있는 UIImage 타입의 변수

    @IBOutlet var imgView: UIImageView!     // 이미지 뷰에 대한 아웃렛 변수
    
    @IBOutlet var btnResize: UIButton!      // 버튼 리사이즈에 대한 아웃렛 변수
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn   // 위에서 할당한 On, Off 이미지를 imgView에 할당
    }


    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0  // scale 상수를 CGFloat(실수형)타입으로 선언하고 값을 2.0으로 설정
        
        var newWidth:CGFloat, newHeight:CGFloat // 변수 2개를 CGFloat타입으로 선언
        
        if (isZoom) { //true
            newWidth = imgView.frame.width/scale   // imgView 객체의 frame이라는 속성을 조절한 것
            newHeight = imgView.frame.height/scale // imgView를 줄였기 때문에 확대되는 것처럼 보임
            btnResize.setTitle("확대", for: .normal)
            
        }
        else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
            
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom  // isZoom 변수의 상태를 !연산자로 반전
    }
    @IBAction func swichImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}



//viewDidLoad 함수
//내가 만든 뷰를 불러올 때 호출되는 함수로, 부모클래스인 UIViewController클래스에 선언되어 있음
//뷰가 불려진 후 실행하고자. 하는 기능이 필요할 때 이 viewDidLoad 함수내에 코드를 입력하면 된다
