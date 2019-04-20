//
//  CollectionCategoryCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 14/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class CollectionCategoryCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    class func identifier() -> String {
        return "CollectionCategoryCell"
    }
}
