//
//  LoadingCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 20/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(LoadingCell)
class LoadingCell: CellController {
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! LoadingCellView
        cell.spinner.startAnimating()
        return cell
    }
}

class LoadingCellView: CellView {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
}
