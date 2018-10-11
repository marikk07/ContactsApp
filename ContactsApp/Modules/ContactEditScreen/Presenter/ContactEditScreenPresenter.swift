//
//  ContactEditScreenPresenter.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

// MARK: - Class
class ContactEditScreenPresenter: ContactEditScreenModuleInput, ContactEditScreenViewOutput, ContactEditScreenInteractorOutput {
    

    // MARK: - Viper properties
    weak var view: ContactEditScreenViewInput!
    var interactor: ContactEditScreenInteractorInput!
    var router: ContactEditScreenRouterInput!

    var inputContact: Contact? {
         didSet { self.view.inputContact = inputContact }
    }
    weak var delegate: ContactEditScreenDelegate? {
        didSet { self.interactor.delegate = delegate }
    }
    
    
    // MARK: - Init
    init(view: ContactEditScreenViewInput, router: ContactEditScreenRouterInput) {
        self.view = view
        self.router = router
    }

    // MARK: - ContactEditScreenViewOutput
    func viewIsReady() {

    }
    
    func saveButtonTouchedWith(_ input: ContactInputModel) {
        self.interactor.addNewContactWith(input)
    }
    
    func saveButtonTouchedWithUpdated(_ input: ContactInputModel) {
        self.interactor.updateContactWith(input)
    }
    
    // MARK: - ContactEditScreenInteractorOutput
    func closeModule() {
        self.router.closeModule()
    }
    

}
