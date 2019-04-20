//
//  DetailCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 19/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(DetailCell)
class DetailCell: ProductCell {
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! DetailCellView
        cell.detail.text = self.product.detail.replacingOccurrences(of: "<br/>", with: "\n")
        
        return cell
    }
    
    
    
}

class DetailCellView: CellView {
    @IBOutlet weak var detail: UILabel!
}
