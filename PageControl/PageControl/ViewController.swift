//
//  ViewController.swift
//  PageControl
//
//  Created by 장한솔 on 2021/02/07.
//

import UIKit

var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]

class ViewController: UIViewController
{
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count  // numberOfPages : 페이지컨트롤의 전체 페이지 수
        
        pageControl.currentPage = 0 // currentPage : 현재 페이지
        
        pageControl.pageIndicatorTintColor = UIColor.green // pageIndicatorTintColor : 페이지컨트롤의 페이지를 표시하는 부분의 색상
        
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }


    @IBAction func pageChange(_ sender: UIPageControl)
    {
        // pageControl의 현재페이지를 가지고 옴 -> 현재 페이지에 해당하는 이미지이름을 배열에서 가지고 옴
        // -> UIImage로 만듦 -> 만든 이미지를 이미지뷰에 할당
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
}

