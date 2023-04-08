
import UIKit

final class SeatCoordinator {
    func start(navigationController: UINavigationController?, tarih: Tarih) {
        
        let vc: SeatViewController = UIStoryboard.loadViewController(name: "SeatViewController") as! SeatViewController
        
        vc.viewModel = SeatViewModel(tarih: tarih)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
