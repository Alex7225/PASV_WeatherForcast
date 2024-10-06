//
//  TableViewCells.swift
//  PASV_WeatherForcast
//
//  Created by Oleksandr Hryhoruk on 25/09/2024.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    private var cityView: CityView = {
        let city = CityView()
        city.translatesAutoresizingMaskIntoConstraints = false
        return city
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        setupSubViews()
        setupConstraints()
    }
    
    private func setupSubViews() {
        contentView.addSubview(cityView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cityView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cityView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cityView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cityView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func setup(model: SearchModel) {
        cityView.setup(model: model)
    }
}
