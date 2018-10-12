//
//  ContactEditScreenInitializer.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import UIKit

class ContactEditScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var contactEditScreenViewController: ContactEditScreenViewController!

    override func awakeFromNib() {
        let configurator = ContactEditScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: contactEditScreenViewController)
    }

}
