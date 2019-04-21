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
        self.setViewStatus(rows.count == 0 ? .emptyData : .presenting)
    }
    
    func appendRows(_ rows: [AnyObject]) {
        self.tableView.removeAt(position: self.tableView.rows.count-1, rowsCount: 0, animation: .automatic)
        self.tableView.insertRows(rows: rows, at: self.tableView.rows.count, animation: .top)
        self.presenter.enableNextPage()
    }
    
    func errorData() {
        self.setViewStatus(.masterError)
    }
}

// MARK: - TableViewManagerDelegate
extension ProductCollectionView: TableViewManagerDelegate {
    func tableViewManager(table: SelfTableViewManager, didSelectRow row: CellController, atSection section: SectionController?) {
        self.presenter.didSelectRow(row)
    }
    
    func tableViewManager(tableView: SelfTableViewManager, willDisplay cell: CellController) {
        self.presenter.willDisplay(cell)
    }
}

