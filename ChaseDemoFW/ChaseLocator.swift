//
//  ChaseLocator.swift
//  ATMLocator
//
//  Created by RAJESH SUKUMARAN on 9/15/16.
//  Copyright © 2016 RAJESH SUKUMARAN. All rights reserved.
//

import Foundation
import MapKit
class ChaseLocator: LocatioControllerDelegate {
    
    var t :LocatioController!
    var m:MapView!

    func getMapWithPins(view:UIView)
    {
        m = MapView()
        view.addSubview(m.getMapView())
        t = LocatioController()
        t.delegate = self
        t.reuestLocationPermission()
    }
    
    
    func getCords(lat:String,long:String)
    {
        
        
        typealias atmBranches = [AtmBranch]
        _ = Utils.getNearbyFacitiy(lat: lat, long: long) { (data: [AtmBranch]) in
            print("asdf")
            self.m.addAnootaions(obj:data)
            let corrd = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(long)!)
            self.m.atmBranches = data
            let region = MKCoordinateRegion(center:corrd , span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta:0.025))
            self.m.getMapView().setRegion(region, animated: true)
        }
        
        
        t.stopUpdation()
    }

}
