//
//  ViewController.swift
//  Web
//
//  Created by 장한솔 on 2021/02/04.
//

import UIKit
import WebKit  // web할때는 WebKit import

class ViewController: UIViewController
{

    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivitiIndicator: UIActivityIndicatorView!
    
    
    // 함수 인자를 받아서 url로 저장 -> 화면 요청함
    func Load_WebPage(_ url: String)
    {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
        myWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading),
                              options: .new, context: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Load_WebPage("https://github.com/SOL-2") // 앱 실행 시 처음 보여지는 웹페이지
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        
        if keyPath == "loading"
        {
            if myWebView.isLoading
            {
                myActivitiIndicator.startAnimating()
                myActivitiIndicator.isHidden = false
            }
            
            else
            {
                myActivitiIndicator.stopAnimating()
                myActivitiIndicator.isHidden = true
            }
        }
    }
    
    // 주소창에 'http:// 문자열이 없을 때 자동으로 삽입되는 함수
    func checkUrl(_ url: String) -> String
    {
        var Url = url
        let flag = Url.hasPrefix("http://")
        
        if !flag
        {
            Url = "http://" + url
        }
        return Url
    }
    
    
    // 주소창(텍스트 필드)에 적힌 주소로 웹 로딩
    @IBAction func GotoUrl(_ sender: UIButton)
    {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        Load_WebPage(myUrl)
    }
    
    // Site1 버튼 클릭 시 이동
    @IBAction func GoSite1(_ sender: UIButton)
    {
        Load_WebPage("http://naver.com")
    }
    
    // Site2 버튼 클릭 시 이동
    @IBAction func GoSite2(_ sender: UIButton)
    {
        Load_WebPage("http://google.co.kr")
    }
    
    // html 코드를 변수로 저장 -> Html 버튼 클릭 시 문법에 맞게 작성된 문자열 변수를 웹뷰로 나타냄
    @IBAction func Load_HtmlString(_ sender: UIButton)
    {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"https://github.com/SOL-2\">sol</a>로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    // File 버튼 클릭 시 htmlView.html 파일을 웹뷰로 나타냄
    @IBAction func Load_HtmlFile(_ sender: UIButton)
    {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func Stop(_ sender: UIBarButtonItem)
    {
        myWebView.stopLoading()
    }
    
    @IBAction func Refresh(_ sender: UIBarButtonItem)
    {
        myWebView.reload()
    }
    
    @IBAction func Rewind(_ sender: UIBarButtonItem)
    {
        myWebView.goBack()
    }
    
    @IBAction func FastForward(_ sender: UIBarButtonItem)
    {
        myWebView.goForward()
    }
    
    
    
    
}


