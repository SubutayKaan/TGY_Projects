
import Foundation

final class Yolcu: PrintProtocol {
    let adi: String
    let soyadi: String
    let id: String
    
    init(adi: String, soyadi: String, id: String) {
        self.adi = adi
        self.soyadi = soyadi
        self.id = id
    }
    
    // donen string cagrildigi yerde istenirse kullanilmayabilir
    @discardableResult
    func yazdir() -> String {
        let string = "\(adi)-\(soyadi)-\(id)"
        print(string)
        
        return string
    }
}
