//
//  CityView.swift
//  PASV_WeatherForcast
//
//  Created by Oleksandr Hryhoruk on 26/09/2024.
//

import UIKit

class CityView: UIView {
    
    private var cityNamelabel: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 28)
        name.text = ""
        name.textColor = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private var cityTimelabel: UILabel = {
        let time = UILabel()
        time.text = ""
        time.textColor = .black
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    private var cityDescriptionlabel: UILabel = {
        let description = UILabel()
        description.text = ""
        description.textColor = .black
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private var cityTemperaturelabel: UILabel = {
        let temperature = UILabel()
        temperature.font = UIFont.systemFont(ofSize: 28)
        temperature.text = ""
        temperature.textColor = .black
        temperature.translatesAutoresizingMaskIntoConstraints = false
        return temperature
    }()
    
    private var cityHighTemperaturelabel: UILabel = {
        let highTemperature = UILabel()
        highTemperature.text = ""
        highTemperature.textColor = .black
        highTemperature.translatesAutoresizingMaskIntoConstraints = false
        return highTemperature
    }()
    
    private var cityLowTemperaturelabel: UILabel = {
        let lowTemperature = UILabel()
        lowTemperature.text = ""
        lowTemperature.textColor = .black
        lowTemperature.translatesAutoresizingMaskIntoConstraints = false
        return lowTemperature
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    
    private func commonInit() {
        self.backgroundColor = .gray
        layer.cornerRadius = 8
        setupSubViews()
        setupConstraints()
    }
    
    private func setupSubViews() {
        self.addSubview(cityNamelabel)
        self.addSubview(cityTimelabel)
        self.addSubview(cityDescriptionlabel)
        self.addSubview(cityTemperaturelabel)
        self.addSubview(cityLowTemperaturelabel)
        self.addSubview(cityHighTemperaturelabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityNamelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            cityNamelabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            cityTimelabel.leadingAnchor.constraint(equalTo: cityNamelabel.leadingAnchor, constant: 0),
            cityTimelabel.topAnchor.constraint(equalTo: cityNamelabel.bottomAnchor, constant: -2),
            
            cityDescriptionlabel.leadingAnchor.constraint(equalTo: cityNamelabel.leadingAnchor, constant: 0),
            cityDescriptionlabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            cityTemperaturelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            cityTemperaturelabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            
            cityLowTemperaturelabel.trailingAnchor.constraint(equalTo: cityTemperaturelabel.trailingAnchor, constant: 0),
            cityLowTemperaturelabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
        ])
    }
    
    func setup(model: SearchModel) {
        cityNamelabel.text = model.city
        cityTimelabel.text = model.time
        cityDescriptionlabel.text = model.description
        cityTemperaturelabel.text = String(model.temperature) + "℃"
        cityLowTemperaturelabel.text = "H: \(model.highTemperature)℃ L: \(model.lowTemperature)℃"
    }
}
