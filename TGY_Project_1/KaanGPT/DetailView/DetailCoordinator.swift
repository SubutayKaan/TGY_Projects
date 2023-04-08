//
//  DetailCoordinator.swift
//  KaanGPT
//
//  Created by Subutay Kaan Sevim on 8.04.2023.
//

import UIKit

final class DetailCoordinator {
    func start(selectedSeats: [SeatStub], tarih: Tarih) -> UIViewController {
        let vc = UIStoryboard.loadViewController(name: "DetailViewController") as! DetailViewController
        vc.viewModel = DetailViewModel(selectedSeats: selectedSeats, tarih: tarih)
        return vc
    }
}
