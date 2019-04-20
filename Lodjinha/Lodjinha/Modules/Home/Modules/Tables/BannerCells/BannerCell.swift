//
//  BannerCell.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit
import AlamofireImage

protocol BannerCellDelegate: class {
    func bannerCell(_ banner: Banner)
}

@objc(BannerCell)
class BannerCell: CellController {
    
    let banner: [Banner]
    weak var delegate: BannerCellDelegate?
    
    init(_ banner: [Banner], delegate: BannerCellDelegate) {
        self.banner = banner
        self.delegate = delegate
        super.init()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = loadDefaultCellForTable(tableView: tableView, atIndexPath: indexPath) as! BannerCellView
        cell.pageControll.numberOfPages = self.banner.count
        cell.pageControll.hidesForSinglePage = true
        cell.collection.dataSource = self
        cell.collection.delegate = self
        controllerCell = cell
        return cell
    }
    
}

// MARK: - UICollectionViewDataSource
extension BannerCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionBannerCell.identifier(), for: indexPath) as! CollectionBannerCell
        cell.imageView.af_setImage(withURL: self.banner[indexPath.item].imagePath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = controllerCell as? BannerCellView {
            cell.pageControll.currentPage = indexPath.item
        }
    }
}

// MARK: - UICollectionViewDelegate
extension BannerCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.bannerCell(self.banner[indexPath.item])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let cell = controllerCell as? BannerCellView {
            cell.pageControll.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
    }
}

class BannerCellView: CellView {
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let layout = collection.collectionViewLayout as! UICollectionViewFlowLayout
        let identifier = CollectionBannerCell.identifier()
        collection.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
}
