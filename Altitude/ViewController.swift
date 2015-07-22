//
//  ViewController.swift
//  Altitude
//
//  Created by Mathias Beke on 22/07/15.
//  Copyright © 2015 DenBeke. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager:CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var labelAltitude: UILabel!
    
    override func viewDidLoad() {
        
        // Start spinner
        activityIndicator.startAnimating()
        
        // Create location manager & ask for permission
        self.locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        // Get altitude
        let alt = newLocation.altitude
        // Display altitude
        activityIndicator.stopAnimating()
        labelAltitude.text = String(Int(alt)) + "m"
        // Stop location service
        manager.stopUpdatingLocation()
    }
    
    @IBAction func buttonTapToRefresh(sender: AnyObject) {
        // Clean label & start spinner
        self.labelAltitude.text = ""
        self.activityIndicator.startAnimating()
        // Start location service
        self.locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

