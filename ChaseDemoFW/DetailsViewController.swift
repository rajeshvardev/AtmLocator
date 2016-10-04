//
//  DetailsViewController.swift
//  ATMLocator
//
//  Created by RAJESH SUKUMARAN on 9/15/16.
//  Copyright © 2016 RAJESH SUKUMARAN. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var facilityType: UILabel!
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var address: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Chase title"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.black
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(currentfacility:AtmBranch)
    {
        self.address.text = currentfacility.address
        self.name.text = currentfacility.name
        self.Distance.text = currentfacility.distance
        self.facilityType.text = currentfacility.facilitytype
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
