//
//  DependencyInjector.swift
// 
//
//  Created by Maryan Pasichniak on 10/4/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import UIKit

protocol DependencyInjector {
    
    var coreDataStack: CoreDataStack { get }
}

extension DependencyInjector {
    
    var coreDataStack: CoreDataStack {
        return appDelegate.coreDataStack
    }
    
    fileprivate var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}
