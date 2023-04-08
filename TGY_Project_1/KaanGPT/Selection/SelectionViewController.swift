
import UIKit

final class SelectionViewController: UIViewController {
    
    // Injected value
    var viewModel: SelectionViewModel!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var button: UIButton!
    
    enum Constant {
        static let numberOfItems = 3
        
        // decide location cell or date cell
        enum CellIdentifier {
            static let location = "LocationCell"
            static let date = "DateCell"
        }
    }
}

extension SelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.updateButtonStatus() // updates the button status
        return Constant.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellIdentifier.location, for: indexPath) as! LocationCell
            cell.populate(with: .init(destination: "Kalkış", cityName: viewModel.fromCity))
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellIdentifier.location, for: indexPath) as! LocationCell
            
            cell.populate(with: .init(destination: "Varış", cityName: viewModel.toCity))
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.CellIdentifier.date, for: indexPath) as! DateCell
            cell.populate(with: DateFormatter.common.string(from: viewModel.date))
            
            return cell
        default: fatalError("Unknown cell implementation")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let viewController = SelectionTableViewController(nibName: nil, bundle: nil)
            
            viewController.closure = { index in
                self.viewModel.fromCity = Cities.list[index]
                self.tableView.reloadData()
            }
            
            viewController.options = Cities.list
            viewController.title = "Kalkış Yeri"
            show(viewController, sender: self)
        case 1:
            let viewController = SelectionTableViewController(nibName: nil, bundle: nil)
            
            viewController.closure = { index in
                self.viewModel.toCity = Cities.list[index]
                self.tableView.reloadData()
            }
            
            viewController.options = Cities.list
            viewController.title = "Varış Yeri"
            show(viewController, sender: self)
            break
        case 2:
            // Show date
            let picker = UIDatePicker()
            picker.date = viewModel.date
            picker.preferredDatePickerStyle = .wheels
            picker.minimumDate = .now
            picker.maximumDate = .distantFuture
            picker.addTarget(self,
                             action: #selector(didSelectDate(_ :)),
                             for: .valueChanged)
            
            var frame = picker.frame
            frame.size.width = UIScreen.main.bounds.width
            frame.origin.y = tableView.frame.origin.y + tableView.frame.size.height + 10
            
            view.addSubview(picker)
            picker.frame = frame
            
        default: fatalError("Unknown cell pressed")
        }
    }
    
    @objc private func didSelectDate(_ sender: UIDatePicker) {
        viewModel.date = sender.date
        sender.removeFromSuperview()
        viewModel.setDate(date: sender.date)
        self.tableView.reloadData()
    }
    
    func updateButtonStatus() {
        button.isEnabled = viewModel.isValid
    }
    
    @IBAction func nextTapped() {
        guard let tarih = viewModel.tarih else {
            return
        }
        SeatCoordinator().start(navigationController: navigationController, tarih: tarih)
    }
}
