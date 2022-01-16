//
//  UITableViewExt.swift
//  GitReposDemo
//
//  Created by Andrej Lukes on 16/01/2022.
//

import Foundation
import UIKit

public protocol CellRepresentable {
    var reuseIdentifier:String { get }
}

public protocol TableViewCellRepresentable : CellRepresentable {
    var height:CGFloat { get }
}

public protocol Setupable {
    func setup(_ values:Any?)
}

extension UITableView
{
    
    public func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T?
    {
        return dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T
    }
    
    public func registerCell<T: UITableViewCell>(_ cell : T.Type)
    {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
    
    public func cell(indexPath:IndexPath, viewModel:TableViewCellRepresentable) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier, for: indexPath)
        guard let setupable = cell as? Setupable else { return UITableViewCell() }
        setupable.setup(viewModel)
        return cell
    }
}
