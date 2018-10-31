//
//  ViewController.swift
//  weather-DarkSky-api
//
//  Created by Alvin on 10/31/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    fileprivate func fetchData() {
        Service.shared.fetchCourses { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
        }
    }


}

