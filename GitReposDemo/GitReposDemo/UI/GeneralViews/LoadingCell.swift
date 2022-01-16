import UIKit

//MARK: - Cell view model
class LoadingCellViewModel: TableViewCellRepresentable {
    
    var height: CGFloat = UITableView.automaticDimension
    var reuseIdentifier: String = String(describing: LoadingCell.self)
}

//MARK: - Cell
class LoadingCell: UITableViewCell {
    
    var viewModel: LoadingCellViewModel?
    
    //MARK:- Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
}

// MARK: - Cell Setup
extension LoadingCell : Setupable {
    
    func setup(_ values: Any?) {
        guard let viewModel = values as? LoadingCellViewModel else { return }
        self.viewModel = viewModel
        activityIndicator?.color = .black
        activityIndicator?.startAnimating()
    }
}
