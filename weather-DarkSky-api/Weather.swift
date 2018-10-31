//
//  Weather.swift
//  weather-DarkSky-api
//
//  Created by Alvin on 10/31/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let latitude:Double
    let longitude:Double
    let timezone:String
    let currently:CurrentWeather
    let minutely: MinuteWeather
    let hourly: HourlyWeather
    let daily: DailyWeather
    
}


struct CurrentWeather:Decodable {
    let time: Int
    let summary: String
    let temperature: Float
    
}

struct MinuteWeather:Decodable{
    let summary:String
    
}


struct HourlyWeather:Decodable{
    let summary:String
    
}

struct DailyWeather:Decodable{
    let summary:String

}
