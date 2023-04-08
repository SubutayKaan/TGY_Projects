
import UIKit

final class SelectionViewCoordinator {
    func start() -> UIViewController {
        let vc: SelectionViewController = UIStoryboard.loadViewController(name: "SelectionViewController")
        
        vc.viewModel = SelectionViewModel()
        
        return vc
    }
}
