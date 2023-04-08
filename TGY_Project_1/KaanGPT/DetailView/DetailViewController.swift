
import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var selectedSeatLabel: UILabel!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNameLabel()
        setupIdLabel()
    }
    
    @IBAction private func nextPressed() {
        nameLabel.text = viewModel?.name
        idLabel.text = viewModel?.id
        dateLabel.text = viewModel?.tarih.gunAyYil
        selectedSeatLabel.text = viewModel?.selectedSeatsString
    }
    
    private func setupIdLabel() {
        let size = CGSize(width: stackView.frame.width, height: 50)
        let estimatedFrame = CGRect(origin: stackView.center, size: size)
        let textField = MDCOutlinedTextField(frame: estimatedFrame)
        textField.addTarget(self, action: #selector(idChanged(_:)), for: .editingChanged)
        textField.returnKeyType = .done
        textField.tintColor = .systemIndigo
        textField.label.text = "TC Kimlik Numarası"
        textField.placeholder = ""
        textField.sizeToFit()
        stackView.addArrangedSubview(textField)
    }
    
    private func setupNameLabel() {
        let size = CGSize(width: stackView.frame.width, height: 50)
        let estimatedFrame = CGRect(origin: stackView.center, size: size)
        let textField = MDCOutlinedTextField(frame: estimatedFrame)
        textField.addTarget(self, action: #selector(nameChanged(_:)), for: .editingChanged)
        textField.returnKeyType = .done
        textField.tintColor = .systemIndigo
        textField.label.text = "İsim - Soyisim"
        textField.placeholder = ""
        textField.sizeToFit()
        stackView.addArrangedSubview(textField)
    }
    
    @objc private func nameChanged(_ sender: MDCOutlinedTextField) {
        viewModel?.setName(name:  sender.text ?? "")
        nextButton.isEnabled = viewModel?.isButtonEnabled ?? false
    }
    
    @objc private func idChanged(_ sender: MDCOutlinedTextField) {
        viewModel?.setId(id: sender.text ?? "")
        nextButton.isEnabled = viewModel?.isButtonEnabled ?? false
    }
}
