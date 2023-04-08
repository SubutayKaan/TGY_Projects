
import UIKit

final class SignInViewController: UIViewController {
    
    @IBOutlet private weak var isimTextField: UITextField!
    @IBOutlet private weak var soyisimTextField: UITextField!
    @IBOutlet private weak var tcIdTextField: UITextField!
    @IBOutlet private weak var devamButton: UIButton!
    @IBOutlet private weak var zamanPicker: UIDatePicker!
    @IBOutlet private weak var koltukSayisiPicker: UIPickerView!
    
    var viewModel: FirstViewModel?
    
    let koltukSayisiSecenek = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewModel = FirstViewModel()
        
        
        koltukSayisiPicker.dataSource = self
        koltukSayisiPicker.delegate = self
        
        isimTextField.addTarget(self, action: #selector(isimDidChange), for: .editingChanged)
        soyisimTextField.addTarget(self, action: #selector(soyisimDidChange), for: .editingChanged)
        tcIdTextField.addTarget(self, action: #selector(tcDidChage), for: .editingChanged)
    }
    
    // MARK: - Actions
    
    @objc private func isimDidChange() {
        viewModel?.setIsim(to: isimTextField.text)
    }
    
    @objc private func soyisimDidChange() {
        viewModel?.setSoyisim(to: soyisimTextField.text)
    }
    
    @objc private func tcDidChage() {
        viewModel?.setTcId(to: tcIdTextField.text)
    }
    
    
    @IBAction private func devamButtonPressed() {
//        // Rem: tcIdTextField.text -> Int ' e dönüştürülecek.
//        let yolcu = Yolcu.init(adi: isimTextField.text!, soyadi: soyisimTextField.text!, id: tcIdTextField.text!)
//        // Rem: Tarih sınıfı değerleri String olarak değil Int olarak alıcak
//        let tarih = Tarih.init(gunAyYil: zamanPicker.description)
//
//        let isim = isimTextField.text
//        let coordinator = ListViewCoordinator()
//        if let viewController = coordinator.start(username: isim!) {
//            navigationController?.pushViewController(viewController, animated: true)
//        }
    }
}
/* let yolcu = Yolcu(adi: "Subutay", soyadi: "Kaan", id: 1)
    let tarih = Tarih(gun: "12", ay: "4", yil: "2151")
    let saat = Saat(saat: 13, dakika: 46)
    
    let bilet1 = Bilet(yolcu: yolcu,
                        tarih: tarih,
                        saat: saat)
    

    // FLOW
    bilet1.koltukAyir(sayi: koltukSayisiPicker.hashValue)
    bilet1.koltukNoEkle(numara: 2)
    */
 /*       let user: String? = "subutay"
        if let nonOptionalUserName = user {
           let coordinator = ListViewCoordinator()
            if let viewController = coordinator.start(username: nonOptionalUserName) {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
        viewModel?.devam(completion: { success in

            if success {
                print("Success")

            } else {
                print("Wrong username or password")
            }
        })*/
// MARK: - Extensions

extension SignInViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Koltuk Sayısı İçin
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return koltukSayisiSecenek.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return koltukSayisiSecenek[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel?.setKoltukSayisi(to: Int(koltukSayisiSecenek[row]))
    }
}

//extension ViewController: UIDatePicker {
//
//}


