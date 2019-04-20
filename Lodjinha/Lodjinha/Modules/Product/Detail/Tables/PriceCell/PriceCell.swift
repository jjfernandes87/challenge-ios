//
//  PriceCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 19/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

@objc(PriceCell)
class PriceCell: ProductCell {

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! PriceCellView
        cell.newPrice.text = PriceFormatter.shared.doubleToCurrencyStringFormatter(self.product.newPrice)
        cell.price.attributedText = PriceFormatter.shared.doubleToCurrencyStringFormatter(self.product.price).strike()
        return cell
    }
    
}

class PriceCellView: CellView {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var newPrice: UILabel!
}
