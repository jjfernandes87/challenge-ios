//
//  IconCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 19/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import AlamofireImage

@objc(IconCell)
class IconCell: ProductCell {

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! IconCellView
        cell.productIcon.af_setImage(withURL: self.product.imagePath, placeholderImage: UIImage(named: "noImage"))
        return cell
    }
    
}

class IconCellView: CellView {
    @IBOutlet weak var productIcon: UIImageView!
}
