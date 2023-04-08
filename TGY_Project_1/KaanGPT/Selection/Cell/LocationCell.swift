//
//  LocationCell.swift
//  KaanGPT
//
//  Created by Subutay Kaan Sevim on 7.04.2023.
//

import UIKit

final class LocationCell: UITableViewCell {
    @IBOutlet private weak var destionationLabel: UILabel!
    @IBOutlet private weak var cityNameLabel: UILabel!
    
    func populate(with model: LocationCellModel) {
        destionationLabel.text = model.destination
        cityNameLabel.text = model.cityName
    }
}
