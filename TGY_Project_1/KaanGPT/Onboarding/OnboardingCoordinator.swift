
import UIKit

final class OnboardingCoordinator {
    func start() -> UIViewController {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Onboarding")
        
        return vc
    }
}
