//
//  ContactEditScreenInteractor.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

protocol ContactEditScreenDelegate: class {
    func reloadContactsData()
}

class ContactEditScreenInteractor: ContactEditScreenInteractorInput {

    // MARK: - Properties
    weak var output: ContactEditScreenInteractorOutput!
    var dataBaseService: DataBaseServiceInput!
    weak var delegate: ContactEditScreenDelegate?
    
    // MARK: - Init
    init(output: ContactEditScreenInteractorOutput) {
        self.output = output
    }

    // MARK: - ContactEditScreenInteractorInput
    func addNewContactWith(_ input: ContactInputModel) {
        dataBaseService.addNewContactWith(input)
    }
    
    func updateContactWith(_ input: ContactInputModel) {
        dataBaseService.updateContactWith(input)
    }
}

extension ContactEditScreenInteractor: DataBaseServiceOutput {
    
    func successAddedContact() {
        self.output.closeModule()
        self.delegate?.reloadContactsData()
    }
}
