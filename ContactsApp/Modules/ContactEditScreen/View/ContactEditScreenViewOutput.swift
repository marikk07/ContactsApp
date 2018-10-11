//
//  ContactEditScreenViewOutput.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

protocol ContactEditScreenViewOutput {

    func viewIsReady()
    func saveButtonTouchedWith(_ input: ContactInputModel)
    func saveButtonTouchedWithUpdated(_ input: ContactInputModel)
}
