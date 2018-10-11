//
//  ContactListScreenInitializer.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import UIKit

class ContactListScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var contactListScreenViewController: ContactListScreenViewController!

    override func awakeFromNib() {

        let configurator = ContactListScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: contactListScreenViewController)
    }

}
