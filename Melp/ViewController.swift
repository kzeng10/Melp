//
//  ViewController.swift
//  Melp
//
//  Created by Kevin Zeng on 9/5/15.
//  Copyright (c) 2015 Kevin Zeng. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var camera = GMSCameraPosition.cameraWithLatitude(-33.868,
            longitude:151.2086, zoom:6)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        var marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        
        self.view = mapView
        
        //figure out location
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var latestLocation: AnyObject = locations[locations.count - 1]
        
        var latitude = NSString(format: "%.4f",
            latestLocation.coordinate.latitude).doubleValue
        var longitude = NSString(format: "%.4f",
            latestLocation.coordinate.longitude).doubleValue
        println(latitude)
        println(longitude)
        
        var camera = GMSCameraPosition.cameraWithLatitude(latitude,
                longitude:longitude, zoom:6)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        var marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        
        self.view = mapView
        locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
}
