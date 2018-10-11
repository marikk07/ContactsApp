//
//  ContactListScreenModule.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import UIKit

class ContactListScreenModule: Module {
    typealias Input = ContactListScreenPresenter
    
    func instantiateTransitionHandler() -> UIViewController {
        let storyboard = UIStoryboard(name: "ContactListScreen", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? ContactListScreenViewController else {
            fatalError("Could not instantiate ContactListScreenViewController")
        }
        return vc
    }

    required init() {
    }
}