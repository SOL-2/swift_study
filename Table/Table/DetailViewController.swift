//
//  DetailViewController.swift
//  Table
//
//  Created by 장한솔 on 2021/02/10.
//

import UIKit

class DetailViewController: UIViewController
{
    // Main View에서 받을 텍스트를 위해 변수 선언
    var receiveItem = ""
    
    @IBOutlet var Item: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 뷰가 노출될 때마다 내용을 레이블의 텍스트로 표현
        Item.text = receiveItem
    }
    
    func receiveItem(_ item: String)
    {
        // Main View에서 변수를 받기 위한 함수 추가
        receiveItem = item
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        //
    */

 }
