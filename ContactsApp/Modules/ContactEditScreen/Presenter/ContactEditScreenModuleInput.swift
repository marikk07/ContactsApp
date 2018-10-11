//
//  ContactEditScreenModuleInput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

protocol ContactEditScreenModuleInput: ModuleInput {
    var delegate: ContactEditScreenDelegate? { get set }
    var inputContact: Contact? { get set }
}
