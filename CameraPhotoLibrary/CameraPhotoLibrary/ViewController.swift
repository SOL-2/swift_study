//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by 장한솔 on 2021/03/02.
//

import UIKit
import MobileCoreServices


class ViewController: UIViewController, UINavigationControllerDelegate,
                      UIImagePickerControllerDelegate
{
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CaptureImageFromCamera(_ sender: UIButton)
    {
        if (UIImagePickerController.isSourceTypeAvailable(.camera))
        {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
        else
        {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
 
    @IBAction func RecordVideoFromCamera(_ sender: UIButton)
    {
        if (UIImagePickerController.isSourceTypeAvailable(.camera))
        {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
        else
        {
            myAlert("Camera inaccessable", message: "Application cannot access the camera")
        }
        
    }
    
    @IBAction func LoadImageFromLibrary(_ sender: UIButton)
    {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        
        else
        {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album")
        }
    }
    
    @IBAction func LoadVideoFromLibrary(_ sender: UIButton)
    {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
        else
        {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album")
        }
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        
        // 미디어 종류 확인
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        // 미디어가 사진일 경우
        if mediaType.isEqual(to: kUTTypeImage as NSString as String)
        {
            
            // 사진을 가져와 captureImage에 저장함
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            
            // flagImageSave가 true면 가져온 사진은 포토 라이브러리에 저장
            if flagImageSave
            {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        }
        
        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String)
        {
            if flagImageSave
            {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        
        // 현재의 뷰 컨트롤러를 제거 -> 뷰에서 이미지 피커 화면을 제거하여 초기 뷰를 보여줌
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // 사진, 비디오를 찍지 않고 취소하거나 선택하지 않고 취소하는 경우
    // 다시 처음의 뷰 상태로 돌아가야함
    // 현재의 뷰 컨트롤러에 보이는 이미지 피커를 제거하여 초기 뷰 보여 줌
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func myAlert(_ title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

