//
//  ViewController.swift
//  WeatherApp
//
//  Created by Sahadev Tandur on 23/08/17.
//  Copyright © 2017 Sahadev Tandur. All rights reserved.
//

import UIKit
import Alamofire
class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var DateLb: UILabel!
    
    @IBOutlet weak var TempLb: UILabel!
   
    @IBOutlet weak var CurrentWeatherImg: UIImageView!
    
    @IBOutlet weak var CurrentWeatherLb: UILabel!
    
    @IBOutlet weak var LocationLb: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var forcasts = [ForcastData]()
    
    var curwet = CurrentWeather()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
        
        curwet.downloadData {
            //Data loaded
//            self.DownloadForcastData {
//                //update Table View UI
//                self.UpdateMainWeatherData()
//            }
            self.UpdateMainWeatherData()
        }
        // Do any additional setup after loading the view, typically from a nib.
        self.DownloadForcastData {
            //update Table View UI
            //self.UpdateMainWeatherData()
            print("DownloadForcastData done!!!!!!")
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? TableViewCell{
        //var tableviewcell = TableViewCell()
        let forcast = forcasts[indexPath.row]
            cell.SetUpCell(forcast: forcast)
            return cell
        }
        return TableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcasts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func UpdateMainWeatherData()
    {
        DateLb.text = curwet.date
        TempLb.text = curwet.temp
        CurrentWeatherLb.text = curwet.type
        LocationLb.text = curwet.loc
        CurrentWeatherImg.image = UIImage(named: curwet.type)
    }
    
    func DownloadForcastData(Completed : DownloadComplete){
        let forcastURL = URL(string : FORCAST_URL)!
        Alamofire.request(forcastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list{
                        let forcast = ForcastData(eachdict: obj)
                        self.forcasts.append(forcast)
//                        print(weathercell)
                    }
                    self.tableView.reloadData()
                }
            }
        }
        Completed()
        
    }


}

