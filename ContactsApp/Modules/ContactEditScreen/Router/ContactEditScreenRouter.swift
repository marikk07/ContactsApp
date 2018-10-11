//
//  ContactEditScreenRouter.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

class ContactEditScreenRouter: ContactEditScreenRouterInput {
    weak var transitionHandler: TransitionHandler!
    
    func closeModule() {
        self.transitionHandler.closeCurrentModule(animated: true)
    }
}
