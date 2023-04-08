
import Foundation

struct SeatStub {
    let id: String
    let number: Int
    var isMan: Bool?
    let isHall: Bool
}

final class SeatViewModel {
    private(set) var seats: [SeatStub] = []
    private(set) var selectedSeats: [SeatStub] = []
    let tarih: Tarih
    
    init(tarih: Tarih) {
        self.tarih = tarih
    }
    
    func createSeats(count: Int) {
        (1...count).forEach { (count) in
            let isHall = (count - 2) % 5 == 1
            let stub = SeatStub(id: UUID().uuidString,
                                number: count,
                                isMan: Bool.random() ? Bool.random() : nil,
                                isHall: isHall)
            seats.append(stub)
        }
    }
    
    func isSeatSelected(id: String) -> Bool {
        return selectedSeats.contains(where: { $0.id == id})
    }
    
    func selectSeat(at indexPath: IndexPath, isMan: Bool, completion: () -> Void) {
        var selectedSeat = seats[indexPath.row]
        selectedSeat.isMan = isMan
        selectedSeats.append(selectedSeat)
        completion()
    }
}
