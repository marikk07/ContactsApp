//
//  ContactEditScreenModule.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import UIKit

class ContactEditScreenModule: Module {
    typealias Input = ContactEditScreenPresenter
    
    func instantiateTransitionHandler() -> UIViewController {
        let storyboard = UIStoryboard(name: "ContactEditScreen", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? ContactEditScreenViewController else {
            fatalError("Could not instantiate ContactEditScreenViewController")
        }
        return vc
    }

    required init() {
    }
}