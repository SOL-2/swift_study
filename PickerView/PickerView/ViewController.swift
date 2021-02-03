//
//  ViewController.swift
//  PickerView
//
//  Created by 장한솔 on 2021/02/02.
//

import UIKit


// 델리게이트 : 해야할 일을 대신 해주는 역할
// 특정 객체와 상호작용을 할 때 메시지를 넘기면 그 메시지에 대한 책임은 델리게이트로 위임
// 델리게이트 메서드는 해당 역할을 수행하며 처리 결과나 메시지 등을 받음
// 사용자가 객체를 터치했을 때 해야할 일을 델리게이트 메서드에 구현하고
// 해당 객체가 터치되었을 때 델리게이트가 호출되어 위임받은 일을 하게 됨

// UIPickerViewDelegate, UIPickerviewDateSource 클래스 상속받기
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    let Max_arrayNum = 10  // 파일명을 저장할 수 있는 배열의 최대 크기
    let PickerView_Column = 1 // 피커뷰 열의 갯수
    let PickerView_Height:CGFloat = 80  // 피커뷰 높이를 받는 상수
    var imageArray = [UIImage?]() // UIImage 유형을 저장하는 빈 배열 선언
    var imageFileName = ["1.jpg","2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ]
    // 파일 이름을 저장하는 변수

    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imageName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< Max_arrayNum // 0 ~ Max_arrayNum보다 작을 때까지(범위 : 0~9)
        {
            let image = UIImage(named: imageFileName[i]) // image 상수 선언 후 i번째 iamgeFileName를
            imageArray.append(image) // imageArray에 추가한다
        }
        
        imageName.text = imageFileName[0] // 아울렛변수 imageName.text에 imageFileName의 1번째를 저장
        imageView.image = imageArray[0] // 아울렛변수 imageView.image에 imageArray의 1번째를 저장
    }
    
    // 피커뷰 컴포넌트 수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return PickerView_Column
    }
    
    // 피커뷰 높이 설정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return PickerView_Height
    }
    
    // 피커뷰 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return imageFileName.count
    }

    
// 각 row에 대한 타이틀 정의
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
//    {
//        return imageFileName[row]
//    }
    
    
    // 피커뷰의 각 row의 view 설정
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    // 피커뷰가 선택되었을 때 실행
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        imageName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }


}

 
