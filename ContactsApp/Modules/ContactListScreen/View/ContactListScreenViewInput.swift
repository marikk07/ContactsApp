//
//  ContactListScreenViewInput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

protocol ContactListScreenViewInput: class {
    func setupInitialState()
     func updateWithContacts(_ contactsData: [Contact])
}
