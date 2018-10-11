//
//  ContactListScreenInteractorInput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import Foundation

protocol ContactListScreenInteractorInput: ContactEditScreenDelegate {
    func loadContactsData() -> [Contact]
    func removeContactWith(id: String)
    func checkJSONFile()
}
