
import UIKit

final class SignInCoordinator {
    func start() -> UIViewController {
        let str = UIStoryboard(name: "SignInViewController", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "SignInViewController")
        
        return vc
    }
}
