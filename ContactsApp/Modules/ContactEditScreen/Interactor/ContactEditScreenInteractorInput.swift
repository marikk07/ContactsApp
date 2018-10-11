//
//  ContactEditScreenInteractorInput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import Foundation

protocol ContactEditScreenInteractorInput {
    var delegate: ContactEditScreenDelegate? { get set }
    func addNewContactWith(_ input: ContactInputModel)
    func updateContactWith(_ input: ContactInputModel)
}
