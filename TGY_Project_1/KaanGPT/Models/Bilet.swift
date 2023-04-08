
import Foundation

final class Bilet: PrintProtocol {
    let yolcu: Yolcu
    let tarih: Tarih
    let saat: Saat
    var koltuk: [String] = []
    var koltukSayisi: Int = 0
    
    init(yolcu: Yolcu, tarih: Tarih, saat: Saat) {
        self.yolcu = yolcu
        self.tarih = tarih
        self.saat = saat
    }
    
    func koltukAyir(sayi: Int) {
        if koltukSayisi > 0 || !((1...5).contains(sayi)) {
            return
        }
        
        for _ in (1...sayi) {
            self.koltuk.append("")
        }
        
        koltukSayisi = sayi
    }
    
    func koltukNoEkle(numara: Int) {
        guard (1...45).contains(numara) else {
            return
        }
        
        if let firstIndex = koltuk.firstIndex(where: { $0 == "" }) {
            koltuk[firstIndex] = numara.description
        }
    }
    
    // True ise uyari
    func karşilastir(bilet: Bilet) -> Bool {
        for foundKoltuk in bilet.koltuk {
            if self.koltuk.contains(foundKoltuk) {
                return true
            }
        }
        
        return false
    }

    @discardableResult
    func yazdir() -> String {
        let yolcuString = yolcu.yazdir()
        let tarihString = tarih.yazdir()
        let saatString = saat.yazdir()
        let koltukString = koltuk.joined(separator: " ")
        
        let finalString = "\(yolcuString), \(tarihString), \(saatString) | \(koltukString)"
        print(finalString)
        
        return finalString
    }
}
