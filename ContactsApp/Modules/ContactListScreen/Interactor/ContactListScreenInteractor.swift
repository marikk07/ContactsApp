//
//  ContactListScreenInteractor.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//
import Foundation
class ContactListScreenInteractor: ContactListScreenInteractorInput {

    // MARK: - Properties
    weak var output: ContactListScreenInteractorOutput!
    var dataBaseService: DataBaseServiceInput!
    
    // MARK: - Init
    init(output: ContactListScreenInteractorOutput) {
        self.output = output
    }
    
    func checkJSONFile() {
        self.dataBaseService.checkJSONFile()
    }

    // MARK: - ContactListScreenInteractorInput
    func loadContactsData() -> [Contact] {
       return self.dataBaseService.getContactsList()
    }
    
    // MARk: - ContactEditScreenDelegate
    func reloadContactsData() {
        self.output.reloadContactsData()
    }
    
    func removeContactWith(id: String) {
        self.dataBaseService.deleteContactWithId(id)
    }
}

extension ContactListScreenInteractor: DataBaseServiceOutput {
    
    func successAddedContact() {
        self.output.reloadContactsData()
    }
    
}
