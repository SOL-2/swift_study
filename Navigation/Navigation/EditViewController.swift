//
//  EditViewContrllerViewController.swift
//  Navigation
//
//  Created by 장한솔 on 2021/02/09.
//

import UIKit

// 프로토콜 : 특정 객체가 갖추어야 할 기능이나 속성에 대한 설계도
// 선언 형태만 가짐. 실질적 내용은 이 프로토콜을 이용하는 객체에서 정의
 
protocol EditDeligate
{
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}


class EditViewController: UIViewController
{
    var textWayValue: String = ""
    var textMessage: String = ""
    var deligate: EditDeligate?
    
    var isOn = false
    

    @IBOutlet var Way: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var switch_IsOn: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Way.text = textWayValue
        txMessage.text = textMessage
        switch_IsOn.isOn = isOn
    }
    
    @IBAction func Done(_ sender: UIButton)
    {
        if deligate != nil
        {
            deligate?.didMessageEditDone(self, message: txMessage.text!)
            deligate?.didImageOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func switch_imgOnOff(_ sender: UISwitch)
    {
        if sender.isOn
        {
            isOn = true
        }
        else
        {
            isOn = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
