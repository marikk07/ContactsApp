//
//  ContactEditScreenConfigurator.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import UIKit

// MARK: - Configurator
class ContactEditScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ContactEditScreenViewController {
            configure(viewController: viewController)
        }
    }

    // MARK: Assembly
    private func configure(viewController: ContactEditScreenViewController) {

        let router = ContactEditScreenRouter()
        router.transitionHandler = viewController

        let presenter = ContactEditScreenPresenter(view: viewController, router: router)

        let interactor = ContactEditScreenInteractor(output: presenter)

        let dataBaseService = DataBaseService()
        dataBaseService.output = interactor
        interactor.dataBaseService = dataBaseService
        
        presenter.interactor = interactor
        viewController.output = presenter
    }

}
