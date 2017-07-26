//
//  CurrentWeatherVC.swift
//  WeatherJSON
//
//  Created by Avinash Reddy on 7/25/17.
//  Copyright © 2017 theEine. All rights reserved.
//

import UIKit

class CurrentWeatherVC: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    // testing data
    let forecaseAPIKey = "46bc415e6ba60e1aac7158b544687185"
    
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.4233)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let forcastService = ForecastService(APIKey: forecaseAPIKey)
        forcastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            if let currentWeather = currentWeather {
                // Rule: All UI code should happen in main queue
                // So, we will use dispatch to get back to main queue
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temerature {
                        self.temperatureLabel.text = "\(temperature)"
                    } else {
                        self.temperatureLabel.text = "-"
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
