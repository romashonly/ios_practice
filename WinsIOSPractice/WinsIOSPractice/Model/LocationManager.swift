//
//  LocationManager.swift
//  WinsIOSPractice
//
//  Created by Роман Шуркин on 05.05.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import CoreLocation
import UserNotifications
import UIKit

protocol LocationDelegate: class {
    
    func someError(error: Error?)
    func updateLocation(with region: String?)
}

class LocationManager: NSObject {
    
    var locationManager = CLLocationManager()
    
    weak var locationDelegate: LocationDelegate!
    
    init(delegate: LocationDelegate) {
        self.locationDelegate = delegate
    }
    
    func setUp(){
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        self.locationManager.requestWhenInUseAuthorization()
        
        //        self.locationManager.requestLocation()
        
        self.locationManager.delegate = self
        
        guard CLLocationManager.locationServicesEnabled() else { return  }
        
        self.locationManager.startUpdatingLocation()
        
    }
}

extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        DispatchQueue.global(qos: .userInteractive).async{
            guard let location = locations.first else {
                self.locationDelegate.someError(error: nil)
                return
            }
            
            CLGeocoder().reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "en")) { (placemarks, error) in
                guard error == nil, let placemarks = placemarks else{ return self.locationDelegate.someError(error: error) }
                let placemark =  placemarks.first
                guard let adminArea = placemark?.administrativeArea,
                    let country = placemark?.country else { return self.locationDelegate.someError(error: error)  }
                
                self.locationDelegate.updateLocation(with: country + "/" + adminArea)
                self.locationManager.stopUpdatingLocation()
                print("update location")
            }
        }
    }
}


enum LocationGetStatus {
    
    case locationIsGetting
    case error
}
