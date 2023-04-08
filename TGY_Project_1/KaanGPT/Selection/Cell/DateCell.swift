//
//  DateCell.swift
//  KaanGPT
//
//  Created by Subutay Kaan Sevim on 7.04.2023.
//

import UIKit

final class DateCell: UITableViewCell {
    @IBOutlet private weak var timeLabel: UILabel!
    
    func populate(with dateString: String) {
        timeLabel.text = dateString
    }
}
