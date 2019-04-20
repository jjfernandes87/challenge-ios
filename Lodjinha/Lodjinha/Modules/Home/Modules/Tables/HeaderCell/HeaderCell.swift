//
//  HeaderCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(HeaderCell)
class HeaderCell: CellController {
    
    private(set) var title: String
    
    init(title: String) {
        self.title = title
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! HeaderCellView
        cell.headerLabel.text = self.title
        return cell
    }
}

class HeaderCellView: CellView {
    @IBOutlet weak var headerLabel: UILabel!
}
