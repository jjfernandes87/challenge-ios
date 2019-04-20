//
//  EmptyCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 19/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(EmptyCell)
class EmptyCell: CellController {
    
    let left: CGFloat
    let right: CGFloat
    
    init(left: CGFloat = 0, right: CGFloat = 0) {
        self.left = left
        self.right = right
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! EmptyCellView
        cell.left.constant = self.left
        cell.right.constant = self.right
        return cell
    }
}

class EmptyCellView: CellView {
    @IBOutlet weak var left: NSLayoutConstraint!
    @IBOutlet weak var right: NSLayoutConstraint!
}
