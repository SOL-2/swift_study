//
//  ViewController.swift
//  Map
//
//  Created by 장한솔 on 2021/02/05.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var Location_Info1: UILabel!
    @IBOutlet var Location_Info2: UILabel!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Location_Info1.text = ""
        Location_Info2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
        
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D
    {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta:latitudeValue, longitudeDelta:longitudeValue)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        //myMap.setRegion(pRegion, animated: true)
        myMap.setCenter(pLocation, animated: true)
        return pLocation
    }
    
    func setAnnotation(latittudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubtitle: String)
    {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latittudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
        
    }
    
    // 위치가 업데이트 되었을 때 지도에 위치를 나타내기 위한 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!,
                                            completionHandler:
                                                {
                                                    (placemarks, error) -> Void in
                                                    let pm = placemarks!.first
                                                    let country = pm!.country
                                                    var address:String = country!
                                                    if pm!.locality != nil
                                                    {
                                                        address += " "
                                                        address += pm!.locality!
                                                    }
                                                    
                                                    if pm!.thoroughfare != nil
                                                    {
                                                        address += " "
                                                        address += pm!.thoroughfare!
                                                    }
                                                    
                                                    self.Location_Info1.text = "현재 위치"
                                                    self.Location_Info2.text = address
                                                    
                                                })
        locationManager.stopUpdatingLocation()
        
    }

    @IBAction func ChangeLocation(_ sender: UISegmentedControl)
    {
        // 현재 위치
        if sender.selectedSegmentIndex == 0
        {
            self.Location_Info1.text = ""
            self.Location_Info2.text = ""
            locationManager.startUpdatingLocation()
            
        }
        // 신림역
        else if sender.selectedSegmentIndex == 1
        {
            setAnnotation(latittudeValue: 37.483893768305, longitudeValue: 126.92969523169663, delta: 1, title: "신림역 3번 출구", subtitle: "서울특별시 관악구 소재")
            self.Location_Info1.text = "지도 상 위치"
            self.Location_Info2.text = "신림역 3번 출구"
        
            
        }
        // 오설록 티뮤지엄
        else if sender.selectedSegmentIndex == 2
        {
            setAnnotation(latittudeValue: 33.306820109976464, longitudeValue: 126.28964162495832, delta: 0.1, title: "오설록 티뮤지엄", subtitle: "제주특별자치도 서귀포시 소재")
            self.Location_Info1.text = "지도 상 위치"
            self.Location_Info2.text = "오설록 티뮤지엄"
            
        }
    }
    
}

