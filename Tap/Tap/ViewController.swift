//
//  ViewController.swift
//  Tap
//
//  Created by 장한솔 on 2021/02/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     // 버튼을 이용한 뷰 전환
    // [0] 첫번째 화면, [1] 이미지뷰, [2] 데이트피커뷰 -> 로 설정했는데 순서가 꼬인듯 -> 탭바 순서 변경?? storyboard 순서 변경 뭘 해야하는지 아직 모르겠음
    
    // [1] 데이트 피커뷰, [2] 이미지뷰로 변경
    @IBAction func MoveImageView(_ sender: UIButton)
    {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func MoveDatePickerView(_ sender: UIButton)
    {
        tabBarController?.selectedIndex = 1
    }
    
}

