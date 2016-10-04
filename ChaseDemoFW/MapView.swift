//
//  MapView.swift
//  ATMLocator
//
//  Created by RAJESH SUKUMARAN on 9/15/16.
//  Copyright © 2016 RAJESH SUKUMARAN. All rights reserved.
//

import UIKit
import MapKit
class MapView: UIView,MKMapViewDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var atmBranches:[AtmBranch]!
    var mapView:MKMapView!
    
    override init(frame: CGRect) {
        self.mapView = MKMapView()
       
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.mapView = MKMapView()
        super.init(coder: aDecoder)
        
    }
    
    func entry() {
        mapView.frame = CGRect(x:10, y:10, width:(UIApplication.shared.keyWindow?.frame.size.width)!, height:(UIApplication.shared.keyWindow?.frame.size.height)!)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.showsUserLocation = true
        
        
    }
    
    func getMapView() -> MKMapView
    {
        entry()
        return mapView
    }
    
    func addAnootaions(obj:[AtmBranch])
    {
        for x in obj
        {
            let anot = x
            mapView.addAnnotation(anot)
        }
        self.mapView.delegate = self
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view : MKPinAnnotationView
        guard let annotation = annotation as? AtmBranch else {return nil}
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: annotation.identifier!) as? MKPinAnnotationView {
            view = dequeuedView
        }else { //make a new view
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotation.identifier)
        }
        view.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
        view.canShowCallout = true
        return view
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print((view.annotation as! AtmBranch).identifier!)
        let tableView = DetailsViewController()
        //print(tableView.address.text)
        if let navigation = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
        {
            navigation.navigationItem.title = "Chase Atm Locator"
            navigation.navigationItem.leftBarButtonItem = navigation.navigationItem.backBarButtonItem;
            navigation.isNavigationBarHidden = false
            navigation.navigationItem.leftBarButtonItem?.title = "test"
            //navigation.navigationBar.backgroundColor = UIColor.red
            navigation.setNavigationBarHidden(false, animated: true)
            
            
            
            navigation.pushViewController(tableView, animated: true)
            let currentfacility = view.annotation as! AtmBranch
            let x = tableView.view
            tableView.update(currentfacility:currentfacility)

            
            
        }
        else
        {
        let navigation = UINavigationController.init(rootViewController: tableView)
        navigation.navigationItem.title = "Chase Atm Locator"
        navigation.navigationItem.leftBarButtonItem = navigation.navigationItem.backBarButtonItem;
        navigation.isNavigationBarHidden = false
        navigation.navigationItem.leftBarButtonItem?.title = "test"
        navigation.navigationBar.backgroundColor = UIColor.red
        navigation.setNavigationBarHidden(false, animated: true)
        
        
        
        UIApplication.shared.keyWindow?.rootViewController?.present(navigation, animated: true, completion: {
            //navigation.pushViewController(DetailsViewController(), animated: true)
            
                    let currentfacility = view.annotation as! AtmBranch
                    tableView.address.text = currentfacility.address
                    tableView.name.text = currentfacility.name
                    tableView.Distance.text = currentfacility.distance
                    tableView.facilityType.text = currentfacility.facilitytype
            

        })
        }
    }
    
    
    

}
