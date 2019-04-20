//
//  SelfTableViewManagerStatic.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 12/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

open class SelfTableViewManagerStatic: SelfTableViewManager {
    
    override func tableViewManagerType() -> TableViewManagerType {
        return .staticDimension
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let controller = findControllerAtIndexPath(indexPath: indexPath) else { return 44 }
        return controller.tableView(tableView, heightForRowAt: indexPath)
    }
    
}
