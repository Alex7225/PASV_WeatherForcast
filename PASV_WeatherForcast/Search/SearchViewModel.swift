//
//  SearchViewModel.swift
//  PASV_WeatherForcast
//
//  Created by Oleksandr Hryhoruk on 23/09/2024.
//

import UIKit

protocol SearchViewModelDelegate: AnyObject {
    func dataLoaded ()
    
}

class SearchViewModel {
    
    weak var delegate: SearchViewModelDelegate?
    
    // private let infoData = ["New York", "Toronto", "London", "Singapore", "Paris", "Tokyo", "Sydney"]
    private let infoData: [SearchModel] = [SearchModel(city: "London", time: "9.41", description: "Rain", temperature: 18, highTemperature: 21, lowTemperature: 10),
                                           SearchModel(city: "New York", time: "4.41", description: "Cloudy", temperature: 22, highTemperature: 25, lowTemperature: 18),
                                           SearchModel(city: "Toronto", time: "5.41", description: "Clear", temperature: 25, highTemperature: 28, lowTemperature: 17),
                                           SearchModel(city: "Singapore", time: "17.41", description: "Clear", temperature: 37, highTemperature: 41, lowTemperature: 32),
                                           SearchModel(city: "Paris", time: "10.41", description: "Clear", temperature: 28, highTemperature: 29, lowTemperature: 15),
                                           SearchModel(city: "Tokyo", time: "19.41", description: "Partly cloudy", temperature: 26, highTemperature: 29, lowTemperature: 19),
                                           SearchModel(city: "Sydney", time: "22.41", description: "Fog", temperature: 7, highTemperature: 14, lowTemperature: 3)]
    
    private var filteredData: [SearchModel] = []
    
    func didLoad() {
        delegate?.dataLoaded()
    }
    
    func searchedData(data: String) {
        filteredData = infoData.filter{(model: SearchModel) -> Bool in
            return model.city.lowercased().hasPrefix(data.lowercased())
        }
        delegate?.dataLoaded()
    }
    
    func getInfoData() -> [SearchModel] {
        return filteredData.isEmpty ? infoData: filteredData
    }
    
}
