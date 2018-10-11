//
//  ContactEditScreenViewInput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

protocol ContactEditScreenViewInput: class {
    var inputContact: Contact? { get set }
    func setupInitialState()
}
