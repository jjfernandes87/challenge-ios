//
//  BaseViewController.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 19/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

var preloadedMasterErrorXib: UINib!
var preloadedLoadingXib: UINib!
var preloadedNoInternetXib: UINib!
var preloadedEmptyDataXib: UINib!

enum HomeStatus: Int {
    case unknown
    case loading
    case presenting
    case noInternet
    case emptyData
    case masterError
}

class BaseViewController: UIViewController {
    
    internal var status: HomeStatus?
    internal var refreshControl =  UIRefreshControl()
    @IBOutlet weak var tableView: SelfTableViewManager!
    
    @IBOutlet weak var masterErrorXib: UIView?
    @IBOutlet weak var loadingXib: UIView?
    @IBOutlet weak var noInternetXib: UIView?
    @IBOutlet weak var emptyDataXib: UIView?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    deinit {
        print(self.debugDescription)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScreens()
        self.setViewStatus(.loading)
    }
    
    private func setupScreens() {
        var statusViews = [UIView]()
        
        preloadedMasterErrorXib.instantiate(withOwner: self, options: nil)
        if let error = masterErrorXib {
            statusViews.append(error)
        }
        
        preloadedLoadingXib.instantiate(withOwner: self, options: nil)
        if let loading = loadingXib {
            self.spinner.startAnimating()
            statusViews.append(loading)
        }
        
        preloadedNoInternetXib.instantiate(withOwner: self, options: nil)
        if let error = noInternetXib {
            statusViews.append(error)
        }
        
        preloadedEmptyDataXib.instantiate(withOwner: self, options: nil)
        if let error = emptyDataXib {
            statusViews.append(error)
        }
        
        for statusView in statusViews {
            if statusView.superview == nil {
                self.view.addSubview(statusView)
                statusView.frame = self.view.frame
                statusView.clipsToBounds = true
                statusView.alpha = 0.0
                statusView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                statusView.setNeedsDisplay()
            }
        }
    }
    
    private func hiddenAll() {
        self.masterErrorXib?.alpha = 0
        self.loadingXib?.alpha = 0
        self.noInternetXib?.alpha = 0
        self.emptyDataXib?.alpha = 0
    }
    
    private func setupCustomView(_ customView: UIView) {
        customView.alpha = 1.0
        customView.backgroundColor = view.backgroundColor
        view.bringSubviewToFront(customView)
    }
    
    func setViewStatus(_ status: HomeStatus, animated: Bool = true) {
        
        self.status = status
        
        if animated {
            UIView.beginAnimations("HomeStatus", context: nil)
        }
        
        self.hiddenAll()
        
        if status == .loading {
            if let customView = loadingXib {
                spinner.startAnimating()
                setupCustomView(customView)
            }
        }
        
        if status == .noInternet {
            if let customView = noInternetXib {
                setupCustomView(customView)
            }
        }
        
        if status == .emptyData {
            if let customView = emptyDataXib {
                setupCustomView(customView)
            }
        }
        
        if status == .masterError {
            if let customView = masterErrorXib {
                setupCustomView(customView)
            }
        }
        
        if status == .presenting {
            spinner.stopAnimating()
        }
        
        if(animated) {
            UIView.commitAnimations()
        }
        
    }
}
