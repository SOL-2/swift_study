//
//  ViewController.swift
//  Navigation
//
//  Created by 장한솔 on 2021/02/08.
//

import UIKit

class ViewController: UIViewController, EditDeligate
{

    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = imgOn // 앱 실행 시 첫 화면에 전구 켜져있도록
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let editViewController = segue.destination as! EditViewController
        
        
        
        if segue.identifier == "editButton"
        {
            editViewController.textWayValue = "segue: use button"
        }
        
        else if segue.identifier == "editBarButton"
        {
            editViewController.textWayValue = "segue: use Bar button"
        }
        
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn // 수정화면의 isOn에 메인화면의 상태를 전달
        editViewController.deligate = self
        
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String)
    {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    {
        if isOn
        {
            imgView.image = imgOn
            self.isOn = true
        }
        
        else
        {
            imgView.image = imgOff
            self.isOn = false
        }
    }


}

