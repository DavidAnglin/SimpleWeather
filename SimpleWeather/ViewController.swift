//
//  ViewController.swift
//  SimpleWeather
//
//  Created by David Anglin on 6/3/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    
    @IBAction func getCurrentWeather() {
        
        toggleRefreshAnimation(on: true)
        
        let coordinate = Coordinate(latitude: 32.967828, longitude: -97.220098)
        client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.toggleRefreshAnimation(on: false)
            }
        }
    }
    
    let client = DarkSkyApiClient()

    // MARK: - View Controller Lifecycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
           activityIndicator.startAnimating()
        } else {
           activityIndicator.stopAnimating()
        }
    }
}

