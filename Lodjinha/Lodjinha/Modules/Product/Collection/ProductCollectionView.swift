//
//  ProductCollectionView.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ProductCollectionView: BaseViewController, ProductCollectionPresenterOutputProtocol {
    
    // MARK: - Viper Module Properties
	var presenter: ProductCollectionPresenterInputProtocol!

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.managerProtocol = self
        self.presenter.loadApplication()
    }

    // MARK: - ProductCollectionPresenterOutputProtocol
    func setRows(_ rows: [AnyObject]) {
        self.tableView.setRows(rows)
        self.setViewStatus(.presenting)
    }

}

// MARK: - TableViewManagerDelegate
extension ProductCollectionView: TableViewManagerDelegate {
    func tableViewManager(table: SelfTableViewManager, didSelectRow row: CellController, atSection section: SectionController?) {
        self.presenter.didSelectRow(row)
    }
}

