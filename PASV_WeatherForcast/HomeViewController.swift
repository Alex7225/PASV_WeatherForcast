//
//  HomeViewController.swift
//  PASV_WeatherForcast
//
//  Created by Oleksandr Hryhoruk on 17/09/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var nameOfCityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = "TEST"
        return label
    }()
    
    private lazy var mapButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Map", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var searchButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Search", for: .normal)
        let symbolImage = UIImage(systemName: "map")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        view.addSubview(mapButton)
        view.addSubview(searchButton)
        view.addSubview(nameOfCityLabel)
        
        mapButton.addTarget(self, action: #selector(mapAction), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            mapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            mapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            searchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            nameOfCityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameOfCityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        // Do any additional setup after loading the view.
    }
    
    @objc private func mapAction() {
        let mapVC = MapViewController()
        present(mapVC, animated: true)
    }
    
    @objc private func searchAction() {
        let searchVC = SearchViewController()
        searchVC.delegate = self
        //searchVC.modalPresentationStyle = .fullScreen
        //present(searchVC, animated: true)
        navigationController?.pushViewController(searchVC, animated: true)
    }
}

extension HomeViewController: SearchViewControllerDelegate {
    func citySelectedByUser(city: String) {
        nameOfCityLabel.text = city
    }
}
