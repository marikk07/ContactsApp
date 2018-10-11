//
//  ContactListScreenViewOutput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

protocol ContactListScreenViewOutput {

    func viewIsReady()
    func addButtonTouched()
    func editContact(_ input: Contact)
    func removeContactWith(id: String)
}
