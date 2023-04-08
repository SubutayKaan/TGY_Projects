
import Foundation

final class FirstViewModel {
    private let testIsim = "subutay"
    private let testSoyisim = "sevim"
    private let testTc = "1"
    
    private(set) var isim: String?
    private var soyisim: String?
    private var tcId: String?
    private(set) var koltukSayisi: Int?
    
    private var iller = [
        "Adana", "Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
        "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
        "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir",
        "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
        "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya",
        "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
        "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak",
        "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak",
        "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"
    ]
    
    func setIsim(to isim: String?) {
        self.isim = isim
    }
    
    func setSoyisim(to soyisim: String?) {
        self.soyisim = soyisim
    }
    
    func setTcId(to tcId: String?) {
        self.tcId = tcId
    }
    
    func setKoltukSayisi(to koltukSayisi: Int?) {
        self.koltukSayisi = koltukSayisi
    }
    
    // ????
    func devam(completion: (Bool) -> Void) {
        // Networkin mock
        if isim == testIsim,
           soyisim == testSoyisim,
           tcId == testTc {
            // Success
            completion(true)
        } else {
            // Fail
            completion(false)
        }
    }
}
