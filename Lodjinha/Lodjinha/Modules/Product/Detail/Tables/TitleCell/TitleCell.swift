//
//  TitleCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 19/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(TitleCell)
class TitleCell: ProductCell {
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! TitleCellView
        cell.name.text = String(format: "%@ - %@", self.product.category.category ,self.product.name)
        return cell
    }
    
}

class TitleCellView: CellView {
    @IBOutlet weak var name: UILabel!
}
