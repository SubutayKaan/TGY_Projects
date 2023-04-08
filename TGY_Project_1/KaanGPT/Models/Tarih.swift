
import Foundation

final class Tarih: PrintProtocol {
    let gunAyYil: String
    
    init(gunAyYil: String) {
        self.gunAyYil = gunAyYil
    }
    
    @discardableResult
    func yazdir() -> String {
        let string = "\(gunAyYil)"
        print(string)
        
        return string
    }
}
