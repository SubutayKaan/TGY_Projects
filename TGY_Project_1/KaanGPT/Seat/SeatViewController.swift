
import UIKit
import ALBusSeatView

final class SeatViewController: UIViewController {
    @IBOutlet private weak var seatView: ALBusSeatView!
    @IBOutlet private weak var nextButton: UIButton!
    
    enum Constants {
        static let numberOfSeats = 45
        static let maxSeatLimit = 5
    }
    
    var viewModel: SeatViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Koltuk Seçimi"
        seatView.delegate = self
        seatView.dataSource = self
        setupSeatView()
    }
    
    private func setupSeatView() {
        seatView.delegate = self
        seatView.dataSource = self
        viewModel?.createSeats(count: Constants.numberOfSeats)
        
        seatView.config = MySeatConfig()
        seatView.reload()
    }
    
    @IBAction private func nextPressed() {
        guard let tarih = viewModel?.tarih else {
            return
        }
        let coordinator = DetailCoordinator()
        let vc = coordinator.start(selectedSeats: viewModel?.selectedSeats ?? [],
                                   tarih: tarih)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SeatViewController: ALBusSeatViewDelegate, ALBusSeatViewDataSource {
    func numberOfSections(in seatView: ALBusSeatView) -> Int {
        1
    }
    
    func seatView(_ seatView: ALBusSeatView, numberOfSeatInSection section: Int) -> Int {
        Constants.numberOfSeats
    }
    
    func seatView(_ seatView: ALBusSeatView, seatTypeForIndex indexPath: IndexPath) -> ALBusSeatType {
        
        guard let seat = viewModel?.seats[indexPath.row] else {
            return .none
        }
        
        if seat.isHall { // Hall area
            return .none
        } else if viewModel?.isSeatSelected(id: seat.id) ?? false { // Selected
            return .selected
        } else if seat.isMan ?? false { // Full by man
            return .soldMan
        } else if !(seat.isMan ?? true) { // Full by woman
            return .soldWoman
        } else { // Else not a seat
            return .empty
        }
    }
    
    
    func seatView(_ seatView: ALBusSeatView, seatNumberForIndex indexPath: IndexPath) -> String {
        String(indexPath.row + 1)
    }
    
    //seat view alert
    func seatView(_ seatView: ALBusSeatView, didSelectAtIndex indexPath: IndexPath, seatType: ALBusSeatType, selectionType: ALSelectionType) {
        guard (viewModel?.selectedSeats.count ?? 0) <= Constants.maxSeatLimit - 1 else {
            let alert = UIAlertController(title: "Uyarı", message: "Maksimum 5 koltuk seçilebilir.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel))
        
            navigationController?.present(alert, animated: true)
            return
        }
        
        viewModel?.selectSeat(at: indexPath, isMan: selectionType == .man) { [weak self] in
            self?.seatView.reload()
        }
        
        nextButton.isEnabled = (0...5).contains(viewModel?.selectedSeats.count ?? 0)
    }
}
