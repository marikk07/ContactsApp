//
//  ContactListScreenRouterInput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import Foundation

protocol ContactListScreenRouterInput: class {
    
    func pushEditScreenWithDelegate(_ delegate: ContactEditScreenDelegate)
    func pushEditScreenWithDelegate(_ delegate: ContactEditScreenDelegate, input: Contact)
    
}
