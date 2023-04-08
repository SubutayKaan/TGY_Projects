//
//  DetailViewModel.swift
//  KaanGPT
//
//  Created by Subutay Kaan Sevim on 8.04.2023.
//

import Foundation

final class DetailViewModel {
    let tarih: Tarih
    private(set) var selectedSeats: [SeatStub] = []
    private(set) var name: String = ""
    private(set) var id: String = ""
    
    init(selectedSeats: [SeatStub], tarih: Tarih) {
        self.selectedSeats = selectedSeats
        self.tarih = tarih
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setId(id: String) {
        self.id = id
    }
    
    var selectedSeatsString: String {
        return selectedSeats.map { $0.number.description }.joined(separator: " ,")
    }
    
    var isButtonEnabled: Bool {
        return !name.isEmpty && !id.isEmpty
    }
}
