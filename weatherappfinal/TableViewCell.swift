//
//  TableViewCell.swift
//  weatherappfinal
//
//  Created by Sahadev Tandur on 31/08/17.
//  Copyright © 2017 Sahadev Tandur. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var WeatherImgForDay: UIImageView!
    
    @IBOutlet weak var Day: UILabel!
    
    @IBOutlet weak var type: UILabel!
    
    @IBOutlet weak var MaxTemp: UILabel!
    
    @IBOutlet weak var MinTemp: UILabel!
    
    func SetUpCell(forcast : ForcastData){
        Day.text = forcast.day
        type.text = forcast.type
        MaxTemp.text = "\(Int(forcast.maxtemp))°"
        MinTemp.text = "\(Int(forcast.mintemp))°"
        WeatherImgForDay.image = UIImage(named: forcast.type)
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
