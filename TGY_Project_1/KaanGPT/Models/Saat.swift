
import Foundation

final class Saat: PrintProtocol {
    let saat: Int
    let dakika: Int
    
    init(saat: Int, dakika: Int) {
        self.saat = saat
        self.dakika = dakika
    }
    
    @discardableResult
    func yazdir() -> String {
        let string = "\(saat):\(dakika)"
        print(string)
        
        return string
    }
}
