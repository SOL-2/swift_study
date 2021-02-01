//
//  ViewController.swift
//  ImageViewer
//
//  Created by 장한솔 on 2021/01/28.
//

import UIKit

class ViewController: UIViewController {
    
    var mainImage: UIImage?
    
    var imageName = ["1.png","2.png", "3.png", "4.png", "5.png", "6.png"]
    
    var currentNum:Int=0
    
  
    @IBOutlet var imgView: UIImageView!
    //@IBOutlet var btnBeforeImg: UIButton!
//    @IBOutlet var btnNextImg: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentNum=0
       // mainImage = UIImage(named: imageName[currentNum])
       // imgView.image = mainImage
        
       
        
    }

    @IBAction func beforeImg(_ sender: UIButton) {
        //사진이 1-5번째 순서일 때
        if (currentNum > 0){
            
            currentNum = currentNum-1
            
            mainImage = UIImage(named: imageName[currentNum])
            
            imgView.image = mainImage
            
        }
        // 사진이 다시 0번째 순서일 때
        else {
            currentNum = 5
            
            mainImage = UIImage(named: imageName[currentNum])
            
            imgView.image = mainImage
            
        }
        /*
        요렇게 처리하면 더 좋다.
        if(currentNum>0)
        {
            currentNum-=1
        }
        else{
            currentNum=5
        }
        
        mainImage = UIImage(named: imageName[currentNum])
        
        imgView.image = mainImage
        */
        
    }
    
    @IBAction func NextImg(_ sender: UIButton) {
        //사진이 0-4번째 사진일때
        if (currentNum < 5){
            currentNum = currentNum+1
            
            mainImage = UIImage(named: imageName[currentNum])
            
            imgView.image = mainImage
        }
        //사진이 5번째 사진일때
        else {
            currentNum = 0
            
            mainImage = UIImage(named: imageName[currentNum])
            
            imgView.image = mainImage
        }
        
        
    }
}

