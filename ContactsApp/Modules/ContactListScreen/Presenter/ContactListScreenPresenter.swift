//
//  ContactListScreenPresenter.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

// MARK: - Class
class ContactListScreenPresenter: ContactListScreenModuleInput, ContactListScreenViewOutput, ContactListScreenInteractorOutput {

    // MARK: - Viper properties
    weak var view: ContactListScreenViewInput!
    var interactor: ContactListScreenInteractorInput!
    var router: ContactListScreenRouterInput!
    var userInfo: UserInfoContainer
    
    // MARK: - Init
    init(view: ContactListScreenViewInput, router: ContactListScreenRouterInput, userInfo: UserInfoContainer) {
        self.view = view
        self.router = router
        self.userInfo = userInfo
    }

    // MARK: - ContactListScreenViewOutput
    func viewIsReady() {
        if userInfo.shouldReadJSONFile == false {
            self.interactor.checkJSONFile()
            userInfo.shouldReadJSONFile = true
        }
        let contactsData = self.interactor.loadContactsData()
        self.view.updateWithContacts(contactsData)
    }
    
    func addButtonTouched() {
        self.router.pushEditScreenWithDelegate(self.interactor)
    }
    
    func editContact(_ input: Contact) {
        self.router.pushEditScreenWithDelegate(self.interactor, input: input)
    }
    
    func removeContactWith(id: String) {
        self.interactor.removeContactWith(id: id)
    }
    
    // MARK: - ContactListScreenInteractorOutput
    func reloadContactsData() {
        let contactsData = self.interactor.loadContactsData()
        self.view.updateWithContacts(contactsData)
    }
}
