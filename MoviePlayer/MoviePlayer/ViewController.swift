//
//  ViewController.swift
//  MoviePlayer
//
//  Created by 장한솔 on 2021/02/25.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func PlayInternalMovie(_ sender: UIButton)
    {
        let filePath: String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!) // 앱 파일명을 NSURL 형식으로 변경
        
//        // AVPlayerController의 인스턴스 생성
//        let playerController = AVPlayerViewController()
//
//        // 앞에서 얻은 비디오 URL로 초기화된 AVPlayer의 인스턴스 생성
//        let player = AVPlayer(url: url as URL)
//
//        // AVPlayerViewController의 player 속성에 위의 인스턴스를 할당
//        playerController.player = player
//
//        self.present(playerController, animated: true)
//        {
//            player.play()
//        }
        
        playVideo(url: url) // 위의 내용 대체
    }
    
    @IBAction func PlayExternalMovie(_ sender: UIButton)
    {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url: url)
        

    }
    
    private func playVideo(url: NSURL)
    {
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true)
        {
            player.play()
        }
    }
}

