//
//  ContactListScreenRouter.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

class ContactListScreenRouter: ContactListScreenRouterInput {
    
    weak var transitionHandler: TransitionHandler!
    
    //MARK: ContactListScreenRouterInput
    func pushEditScreenWithDelegate(_ delegate: ContactEditScreenDelegate) {
        self.transitionHandler.openModuleUsingSegue(Const.Segue.editScreen, to: ContactEditScreenModuleInput.self) { (moduleInput) in
            moduleInput.delegate = delegate
        }
    }
    
    func pushEditScreenWithDelegate(_ delegate: ContactEditScreenDelegate, input: Contact) {
        self.transitionHandler.openModuleUsingSegue(Const.Segue.editScreen, to: ContactEditScreenModuleInput.self) { (moduleInput) in
            moduleInput.delegate = delegate
            moduleInput.inputContact = input
        }
    }
}
