
import UIKit

final class OnboardingViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = Constants.numberOfItems
    }
    
    enum Constants {
        static let numberOfItems = 3
    }
    
    private let titles = [
        "Rotanı Bul",
        "Biletini şimdiden ayırt",
        "Tatilin keyfini çıkart",
    ]
    
    private let descpriptions = [
        "Gitmek istediğiniz şehri kolayca seçebilirsiniz.",
        "Gitmek istediğin tarihi hızlıca seçebilirsin.",
        "Seyahat serüveninize bizi de dahil ettiğiniz için teşekkür ederiz."
    ]
    
    private func updateText(index: Int) {
        let title = titles[index]
        let desc = descpriptions[index]
        
        UIView.transition(with: titleLabel,
                      duration: 0.25,
                       options: .transitionCrossDissolve,
                    animations: { [weak self] in
            self?.titleLabel.text = title
                 }, completion: nil)
        
        UIView.transition(with: descriptionLabel,
                      duration: 0.25,
                       options: .transitionCrossDissolve,
                    animations: { [weak self] in
            self?.descriptionLabel.text = desc
                 }, completion: nil)
    }
    
    @IBAction private func skipPressed() {
        let coordinator = SelectionViewCoordinator()
        let vc = coordinator.start()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        
        cell.populate(name: "onboarding-\(indexPath.row)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()

        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size

        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else {
            return
        }
        
        if indexPath.row == Constants.numberOfItems - 1 {
            skipButton.isEnabled = true
        }

        pageControl.currentPage = indexPath.row
        updateText(index: indexPath.row)
    }
}
