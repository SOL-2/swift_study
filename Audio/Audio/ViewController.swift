//
//  ViewController.swift
//  Audio
//
//  Created by 장한솔 on 2021/02/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate
{
    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    var progressTimer : Timer!
    
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)

    @IBOutlet var progressPlay: UIProgressView!
    @IBOutlet var CurrentTime: UILabel!
    @IBOutlet var EndTime: UILabel!
    
    @IBOutlet var PlayBtn: UIButton!
    @IBOutlet var PauseBtn: UIButton!
    @IBOutlet var StopBtn: UIButton!
    
    @IBOutlet var Volume: UISlider!
    
    @IBOutlet var RecordBtn: UIButton!
    @IBOutlet var RecordTime: UILabel!
    
    var audioRecorder : AVAudioRecorder!
    var isRecordMode = false
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectAudioFile()
        
        if !isRecordMode
        {
            initPlay()
            RecordBtn.isEnabled = false
            RecordTime.isEnabled = false
        }
        else
        {
            initRecord()
        }
    }
    
    func selectAudioFile()
    {
        if !isRecordMode
        {
            audioFile = Bundle.main.url(forResource: "bensound-thejazzpiano", withExtension: "mp3")
        }
        
        else
        {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func initRecord()
    {
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
            AVSampleRateKey : 44100.0] as [String : Any]
        
        do
        {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        }
        catch let error as NSError
        {
            print("Error-initRecord : \(error)")
        }
        audioRecorder.delegate = self  //AudioRecorder의 델리게이트를 self로 설정
        
        Volume.value = 1.0  // 볼륨 슬라이더 값 1.0으로 설정
        audioPlayer.volume = Volume.value // audioPlayer의 볼륨을 슬라이더와 동일하게
        EndTime.text = convertNSTimeInterval2String(0) // 총 재생시간 0
        CurrentTime.text = convertNSTimeInterval2String(0) // 현재 재생 시간 0
        setPlayButtons(false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do
        {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch let error as NSError
        {
            print("Error-setCategory : \(error)")
        }
        
        do
        {
            try session.setActive(true)
        }
        catch let error as NSError
        {
            print("Error-setActive : \(error)")
        }
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
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updatePlayTime()
    {
        CurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        progressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @IBAction func PauseAudio(_ sender: UIButton)
    {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    
    @IBAction func StopAudio(_ sender: UIButton)
    {
        audioPlayer.stop()
        audioPlayer.currentTime = 0 // 오디오 정지하고 다시 재생하면 처음부터 재생
        CurrentTime.text = convertNSTimeInterval2String(0) // 재생시간 초기화
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate() // 타이머 무효화
    }
    
    @IBAction func ChangeVolume(_ sender: UISlider)
    {
        audioPlayer.volume = Volume.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
    }
    
    @IBAction func RecordMode(_ sender: UISwitch)
    {
        if sender.isOn
        {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            RecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            RecordBtn.isEnabled = true
            RecordTime.isEnabled = true
        }
        else
        {
            isRecordMode = false
            RecordBtn.isEnabled = false
            RecordTime.isEnabled = false
            RecordTime.text = convertNSTimeInterval2String(0)
        }
        
        selectAudioFile()
        
        if !isRecordMode
        {
            initPlay()
        }
        else
        {
            initRecord()
        }
    }
    
    @IBAction func RecordBtn(_ sender: UIButton)
    {
        if (sender as AnyObject).titleLabel?.text == "Record"
        {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        }
        else
        {
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            PlayBtn.isEnabled = true
            initPlay()
        }
    }
    
    @objc func updateRecordTime()
    {
        RecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }

    
}

