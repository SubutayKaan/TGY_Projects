
import UIKit

final class PrimaryValue: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .systemIndigo
        
        let size = titleLabel?.font.pointSize
        titleLabel?.font = UIFont(name: "Gill Sans", size: size ?? 0)
        
    }
}
