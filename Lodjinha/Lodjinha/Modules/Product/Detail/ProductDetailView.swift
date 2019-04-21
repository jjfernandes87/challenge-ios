//
//  ProductDetailView.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class ProductDetailView: BaseViewController, ProductDetailPresenterOutputProtocol {

    // MARK: - Module @IBoutlets
    @IBOutlet weak var bookButton: UIButton!
    
	// MARK: - Viper Module Properties
	var presenter: ProductDetailPresenterInputProtocol!

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadApplication()
        bookButton.tintColor = .white
        bookButton.layer.cornerRadius = 10
        bookButton.backgroundColor = .purple
    }

    // MARK: - ProductDetailPresenterOutputProtocol
    func setRows(_ rows: [AnyObject]) {
        self.tableView.setRows(rows)
        setViewStatus(.presenting)
    }
    
    func enableButton() {
        self.bookButton.isEnabled = true
    }
    
    func errorData() {
        setViewStatus(.masterError)
    }
    
    @IBAction func bookAction(sender: UIButton) {
        sender.isEnabled = false
        self.presenter.bookAction()
    }

}
