//
//  OnboardingCell.swift
//  KaanGPT
//
//  Created by Subutay Kaan Sevim on 7.04.2023.
//

import UIKit

final class OnboardingCell: UICollectionViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    
    func populate(name: String) {
        iconImageView.image = UIImage(named: name)
    }
}
