//
//  ProductCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import AlamofireImage

@objc(ProductCell)
class ProductCell: CellController {
    
    let product: Product
    
    init(_ product: Product) {
        self.product = product
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! ProductCellView
        cell.name.text = String(format: "%@ - %@", self.product.category.category ,self.product.name)
        cell.productIcon.af_setImage(withURL: self.product.imagePath, placeholderImage: UIImage(named: "noImage"))
        cell.newPrice.text = PriceFormatter.shared.doubleToCurrencyStringFormatter(self.product.newPrice)
        cell.price.attributedText = PriceFormatter.shared.doubleToCurrencyStringFormatter(self.product.price).strike()
        
        return cell
    }
}

class ProductCellView: CellView {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var productIcon: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var newPrice: UILabel!
}
