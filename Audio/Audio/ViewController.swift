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
        audioFile = Bundle.main.url(forResource: "bensound-thejazzpiano", withExtension: "mp3")
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
        
        EndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        CurrentTime.text = convertNSTimeInterval2String(0)
        
//        PlayBtn.isEnabled = true
//        PauseBtn.isEnabled = false
//        StopBtn.isEnabled = false
        
        setPlayButtons(true, pause: false, stop: false) // 위의 코드 내용과 동일
    }
    
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool)
    {
        PlayBtn.isEnabled = play
        PauseBtn.isEnabled = pause
        StopBtn.isEnabled = stop
    }
    
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String
    {
        let min = Int(time/60) // 재생시간의 매개변수인 time값을 60으로 나눈 몫을 정수값으로 변환하여 초기화
        let sec = Int(time.truncatingRemainder(dividingBy: 60)) // 나머지값을 정수값으로 변환하여 sec에 초기화
        let strTime = String(format: "%02d:%02d", min, sec) // 위의 두개 값을 str으로 변환
        return strTime
    }

    @IBAction func PlayAudio(_ sender: UIButton)
    {
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
    }
    
    @IBAction func PauseAudio(_ sender: UIButton)
    {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    
    @IBAction func StopAudio(_ sender: UIButton)
    {
        audioPlayer.stop()
        setPlayButtons(true, pause: false, stop: false)
    }
    
    @IBAction func ChangeVolume(_ sender: UISlider)
    {
    }
}

