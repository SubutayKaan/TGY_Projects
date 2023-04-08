
import UIKit

extension UIStoryboard {
    static func loadViewController<T>(name: String) -> T where T: UIViewController {
        let sb = UIStoryboard(name: name, bundle: nil)
        
        guard let vc = sb.instantiateInitialViewController() as? T else {
            fatalError("\(String(describing: T.self)) view controller cannot be found!")
        }
        
        return vc
    }
    
}
