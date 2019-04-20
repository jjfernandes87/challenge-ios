//
//  HomeView.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class HomeView: BaseViewController, HomePresenterOutputProtocol {
    
    // MARK: - Viper Module Properties
	var presenter: HomePresenterInputProtocol!

	// MARK: - Override methods

	override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.managerProtocol = self
        self.presenter.loadApplication()
    }

    // MARK: - HomePresenterOutputProtocol
    func setRows(_ rows: [AnyObject]) {
        self.tableView.setRows(rows)
        self.setViewStatus(.presenting)
    }

}

// MARK: - TableViewManagerDelegate
extension HomeView: TableViewManagerDelegate {
    func tableViewManager(table: SelfTableViewManager, didSelectRow row: CellController, atSection section: SectionController?) {
        self.presenter.didSelectRow(row)
    }
}
