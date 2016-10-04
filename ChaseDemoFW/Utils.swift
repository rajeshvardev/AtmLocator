//
//  Utils.swift
//  ATMLocator
//
//  Created by RAJESH SUKUMARAN on 9/15/16.
//  Copyright © 2016 RAJESH SUKUMARAN. All rights reserved.
//

import Foundation
import Alamofire
class Utils {
    typealias atmBranches = [AtmBranch]
    class func getNearbyFacitiy(lat:String,long:String,closure:@escaping (_ obj:[AtmBranch])->()) -> ([AtmBranch]) {
        
        var AtmBranches:[AtmBranch] = []
        let urlWithLatLong = "https://m.chase.com/PSRWeb/location/list.action?lat=\(lat)&lng=\(long)"
        Alamofire.request(urlWithLatLong).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                let json = (JSON as?  NSDictionary)
                let locations = json?["locations"] as! NSArray
                for location in locations
                {
                    AtmBranches.append(AtmBranch(data: location as! Dictionary<String, AnyObject>))
                }
                
                closure(AtmBranches)
            }
        }
        return AtmBranches
    }
    
    
     }
