//
//  CollectionCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

protocol CategoryCellDelegate: class {
    func categoryCell(_ category: Category)
}

@objc(CategoryCell)
class CategoryCell: CellController {
    
    let categories: [Category]
    weak var delegate: CategoryCellDelegate?
    
    init(_ categories: [Category], delegate: CategoryCellDelegate) {
        self.categories = categories
        self.delegate = delegate
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! CategoryCellView
        cell.collection.dataSource = self
        cell.collection.delegate = self
        return cell
    }
}


// MARK: - UICollectionViewDataSource
extension CategoryCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCategoryCell.identifier(), for: indexPath) as! CollectionCategoryCell
        cell.name.text = self.categories[indexPath.item].category
        cell.imageView.af_setImage(withURL: self.categories[indexPath.item].imagePath, placeholderImage: UIImage(named: "noImage"))
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CategoryCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.categoryCell(categories[indexPath.item])
    }
}

class CategoryCellView: CellView {
    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        let identifier = CollectionCategoryCell.identifier()
        collection.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        layout.itemSize = CGSize(width: 150, height: 150)
    }
}
