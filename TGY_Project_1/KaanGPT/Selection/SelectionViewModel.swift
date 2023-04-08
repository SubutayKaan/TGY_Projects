
import Foundation

enum SelectionCellType {
    case location
    case date
}

final class SelectionViewModel {
    
    var fromCity: String = "-"
    var toCity: String = "-"
    var date: Date = Date.now
    private(set) var tarih: Tarih?
    
    var isValid: Bool {
        Cities.list.contains(fromCity) &&
        Cities.list.contains(toCity) &&
        date > Date()
    }
    
    func setDate(date: Date) {
        tarih = Tarih(gunAyYil: DateFormatter.common.string(from: date))
    }
}
