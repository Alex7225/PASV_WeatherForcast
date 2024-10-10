//
//  SearchModel.swift
//  PASV_WeatherForcast
//
//  Created by Oleksandr Hryhoruk on 25/09/2024.
//
import Foundation
import UIKit

struct SearchModel: Codable {
    
    
    
    let city: String
    let time: String
    let description: String
    let temperature: Int
    let highTemperature: Int
    let lowTemperature: Int
    var hourlyWeather: [String] = []
}
