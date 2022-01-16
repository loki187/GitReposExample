import UIKit

//MARK: - Cell view model
class ErrorCellViewModel: TableViewCellRepresentable {
    
    var height: CGFloat = UITableView.automaticDimension
    var reuseIdentifier: String = String(describing: ErrorCell.self)
    
    //MARK:- Public
    var errorMessage : String?
    
    init(message: String) {
        self.errorMessage = message
    }
}

//MARK: - Cell
class ErrorCell: UITableViewCell {
    
    // MARK: - View Model
    var viewModel:ErrorCellViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var errorMessageLabel: UILabel?
}

// MARK: - Cell Setup
extension ErrorCell : Setupable {
    
    func setup(_ values: Any?) {
        guard let viewModel = values as? ErrorCellViewModel else { return }
        self.viewModel = viewModel
        errorMessageLabel?.text = self.viewModel?.errorMessage
    }
}

