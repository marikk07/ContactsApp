//
//  ContactListScreenConfigurator.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import UIKit

// MARK: - Configurator
class ContactListScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ContactListScreenViewController {
            configure(viewController: viewController)
        }
    }

    // MARK: Assembly
    private func configure(viewController: ContactListScreenViewController) {

        let router = ContactListScreenRouter()
        router.transitionHandler = viewController

        let presenter = ContactListScreenPresenter(view: viewController, router: router, userInfo: UserDefaultsManager())

        let interactor = ContactListScreenInteractor(output: presenter)
        let dataBaseService = DataBaseService()
        dataBaseService.output = interactor
        interactor.dataBaseService = dataBaseService
        
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
