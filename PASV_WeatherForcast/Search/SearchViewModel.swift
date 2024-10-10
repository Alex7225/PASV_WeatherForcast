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
    private var infoData: [SearchModel] = [SearchModel(city: "London", time: "9.41", description: "Rain", temperature: 18, highTemperature: 21, lowTemperature: 10),
                                           SearchModel(city: "New York", time: "4.41", description: "Cloudy", temperature: 22, highTemperature: 25, lowTemperature: 18),
                                           SearchModel(city: "Toronto", time: "5.41", description: "Clear", temperature: 25, highTemperature: 28, lowTemperature: 17),
                                           SearchModel(city: "Singapore", time: "17.41", description: "Clear", temperature: 37, highTemperature: 41, lowTemperature: 32),
                                           SearchModel(city: "Paris", time: "10.41", description: "Clear", temperature: 28, highTemperature: 29, lowTemperature: 15),
                                           SearchModel(city: "Tokyo", time: "19.41", description: "Partly cloudy", temperature: 26, highTemperature: 29, lowTemperature: 19),
                                           SearchModel(city: "Sydney", time: "22.41", description: "Fog", temperature: 7, highTemperature: 14, lowTemperature: 3)]
    
    private var filteredData: [SearchModel] = []
    
    func didLoad() {
        //getSearchData()
        delegate?.dataLoaded()
        saveSearchData(data: infoData)
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
    
    func codingDataJSON() -> Data? {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(infoData)
            return data
        } catch {
            print("Error encoding data: \(error)")
            return nil
        }
        
    }
    
    func decodingDataJSON(data: Data?) -> [SearchModel]? {
        guard let data = data else { return nil }
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode([SearchModel].self, from: data)
            return data
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }
    
    func saveSearchData(data: [SearchModel]) {
        let userDefaults = UserDefaults.standard
        guard let encodedData = codingDataJSON() else { return }
        userDefaults.set(encodedData, forKey: "searchData")
        
    }
    
    func getSearchData() {
        let userDefaults = UserDefaults.standard
        let userData = userDefaults.data(forKey: "searchData")
        if let userDecodedData = decodingDataJSON(data: userData) {
            print("Successfully decoded data:")
            infoData = userDecodedData
        }
    }
}
