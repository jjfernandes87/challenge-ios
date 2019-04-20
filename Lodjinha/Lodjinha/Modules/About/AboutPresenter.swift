//
//  AboutPresenter.swift
//  Lodjinha
//
//  Created Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

class AboutPresenter: NSObject, AboutPresenterInputProtocol, AboutInteractorOutputProtocol {

	// MARK: - Viper Module Properties

    weak var view: AboutPresenterOutputProtocol!
    var interactor: AboutInteractorInputProtocol!
    var wireframe: AboutWireframeProtocol!

    // MARK: - AboutPresenterInputProtocol

    // MARK: - AboutPresenterInteractorOutputProtocol

	// MARK: - Private Methods

}
