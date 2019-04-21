//
//  Bundle.swift
//  Lodjinha
//
//  Created by Julio Fernandes on 20/04/19.
//  Copyright © 2019 Julio Fernandes. All rights reserved.
//

import UIKit

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
