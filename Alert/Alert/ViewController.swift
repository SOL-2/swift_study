//
//  ViewController.swift
//  Alert
//
//  Created by 장한솔 on 2021/02/03.
//

import UIKit

class ViewController: UIViewController
{
    // 앱이 종료될 때까지 image가 변하지 않기 때문에 상수로 처리
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true // boolean 변수(전구가 켜졌으면 true, 꺼졌으면 false)
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }

    @IBAction func LampOn(_ sender: UIButton)
    {
        if(isLampOn == true)
        {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 ON 상태입니다", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
        
        else
        {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func LampOff(_ sender: UIButton)
    {
        if(isLampOn==true)
        {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func LampRemove(_ sender: UIButton)
    {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default,
                                      handler:
                                        {
                                            ACTION in self.lampImg.image = self.imgOff
                                            self.isLampOn = false
                                        })
        
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default,
                                     handler:
                                        {
                                            ACTION in self.lampImg.image = self.imgOn
                                            self.isLampOn = true
                                        })
        
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.destructive,
                                         handler:
                                            {
                                                ACTION in self.lampImg.image = self.imgRemove
                                                self.isLampOn = false
                                            })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
    
    
}

