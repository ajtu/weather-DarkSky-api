//
//  Services.swift
//  weather-DarkSky-api
//
//  Created by Alvin on 10/31/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//
import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchCourses(completion: @escaping (Weather?, Error?) -> ()) {
        let urlString = "https://api.darksky.net/forecast/f9cfac369f51361bc2bc4ded467080aa/40.7755,-73.8731"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            
            let dataString = String(data: data, encoding: .utf8)
            //            print(dataString)
            do {
                let courses = try JSONDecoder().decode(Weather.self, from: data)
                //                print(courses.timezone)
                
                
                let actualTime = Date(timeIntervalSince1970: TimeInterval(courses.currently.time))
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                formatter.timeZone = TimeZone(abbreviation: "EST")
                let estDate = formatter.string(from: actualTime)
                print("Latitude:\(courses.latitude) , Longitude:\(courses.longitude)")
                print("Current Weather is: \(courses.currently.summary) and \(courses.currently.temperature) °F")
                print("Minutely Weather is: \(courses.minutely.summary) ")
                print("Hourly Weather is: \(courses.hourly.summary)")
                print("Daily Weather is: \(courses.daily.summary)")
                print("Time in Eastern Time Zone  is \(estDate)")
                
                
                
                DispatchQueue.main.async {
                    //                    completion(courses, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}

