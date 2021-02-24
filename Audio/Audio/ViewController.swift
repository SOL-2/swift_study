//
//  ViewController.swift
//  Audio
//
//  Created by 장한솔 on 2021/02/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate
{
    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    var progressTime : Timer!

    @IBOutlet var progressPlay: UIProgressView!
    @IBOutlet var CurrentTime: UILabel!
    @IBOutlet var EndTime: UILabel!
    
    @IBOutlet var PlayBtn: UIButton!
    @IBOutlet var PauseBtn: UIButton!
    @IBOutlet var StopBtn: UIButton!
    
    @IBOutlet var Volume: UISlider!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioFile = Bundle.main.url(forResource: "우리는", withExtension: "m4a")
        initPlay()
    }
    
    func initPlay()
    {
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }
        catch let error as NSError
        {
            print("Error-initPlay : \(error)")
        }
        
        Volume.maximumValue = MAX_VOLUME // 최대 볼륨을 상수(10.0)으로 초기화
        Volume.value = 1.0 // 슬라이더 볼륨을 1.0으로 초기화
        progressPlay.progress = 0 // 프로그레스 뷰를 0으로 초기화
        
        audioPlayer.delegate = self // audioPlayer의 델리게이트를 self로
        audioPlayer.prepareToPlay()
        audioPlayer.volume = Volume.value // audioPlayer의 볼륨을 슬라이더의 볼륨값으로 초기화
    }

    @IBAction func PlayAudio(_ sender: UIButton)
    {
    }
    
    @IBAction func PauseAudio(_ sender: UIButton)
    {
    }
    
    @IBAction func StopAudio(_ sender: UIButton)
    {
    }
    
    @IBAction func ChangeVolume(_ sender: UISlider)
    {
    }
}

