//
//  FirstViewController.swift
//  ProjectCapstone
//
//  Created by Mario Reyes Ojeda on 19/06/17.
//  Copyright © 2017 Mario Reyes Ojeda. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class FirstViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var initLocation: CLLocation?
    var handlerLocation = CLLocationManager()
    
    @IBOutlet weak var mapOuletBind: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        gestureRecognizer.delegate = self as? UIGestureRecognizerDelegate
        mapOuletBind.addGestureRecognizer(gestureRecognizer)
        
        mapOuletBind.delegate = self
        handlerLocation.delegate = self
        handlerLocation.desiredAccuracy = kCLLocationAccuracyBest
        handlerLocation.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            handlerLocation.startUpdatingLocation()
            mapOuletBind.showsUserLocation = true
        }else{
            handlerLocation.stopUpdatingLocation()
            mapOuletBind.showsUserLocation = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let actualLocation: CLLocation = manager.location!
        if initLocation == nil{
            initLocation = actualLocation
            initMapLocation(initLocation!)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "Error", message: "Your location isn't available now", preferredStyle: .alert)
        let approveAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(approveAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func initMapLocation(_ initLocation :CLLocation){
        let region = MKCoordinateRegionMakeWithDistance(initLocation.coordinate, 500, 500)
        mapOuletBind.setRegion(region, animated: true)
    }

    
    func mapView(_ mapView: MKMapView, didUpdate
        userLocation: MKUserLocation) {
        mapOuletBind.centerCoordinate = userLocation.location!.coordinate
    }
    
    func handleTap(gestureReconizer: UILongPressGestureRecognizer) {
        
        let location = gestureReconizer.location(in: mapOuletBind)
        let coordinate = mapOuletBind.convert(location,toCoordinateFrom: mapOuletBind)
        
        // Add annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapOuletBind.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

