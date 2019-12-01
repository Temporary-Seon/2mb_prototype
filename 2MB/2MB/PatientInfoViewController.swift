//
//  PatientInfoViewController.swift
//  2MB
//
//  Created by 조선우 on 30/11/2019.
//  Copyright © 2019 조선우. All rights reserved.
//

import Foundation
import UIKit

class PatientInfoViewController: UIViewController {
    
    lazy var segCon: UISegmentedControl = {
        
        let sc: UISegmentedControl = UISegmentedControl(items: array)
        sc.addTarget(self, action: #selector(segconChanged(segcon:)), for: UIControl.Event.valueChanged)
        sc.center = CGPoint(x: self.view.frame.width/2 - 60 , y: 380)
        sc.setWidth(120, forSegmentAt: 0)
        sc.setWidth(120, forSegmentAt: 1)
        sc.backgroundColor = UIColor.darkGray
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 1
        
        return sc
    }()
    
    lazy var reserveDatePicker: UIDatePicker = {
        
        let rdp = UIDatePicker(frame: CGRect(x:0, y:410, width: self.view.frame.width, height: 200))
        rdp.datePickerMode = UIDatePicker.Mode.date
        rdp.isEnabled = false
        
        return rdp
    }()
    
    let array: [String] = ["Y", "N"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(segCon)
        self.view.addSubview(reserveDatePicker)
        
    }
    
    @objc func segconChanged(segcon: UISegmentedControl) {
        //called when the value of swttermined control has chaged
        
        
        switch segcon.selectedSegmentIndex {
        case 0:
            self.reserveDatePicker.isEnabled = true
        case 1:
            self.reserveDatePicker.isEnabled = false
        default:
            return
        }
    }

    @IBAction func goTo1(_ sender: Any) {
        performSegue(withIdentifier: "unwindVC1", sender: self)
    }
    
}
