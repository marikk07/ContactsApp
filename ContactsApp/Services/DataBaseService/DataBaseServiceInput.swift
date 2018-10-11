//
//  DataBaseServiceInput.swift
//  WeatherApp
//
//  Created by Maryan Pasichniak on 10/11/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation

protocol DataBaseServiceInput {
    func checkJSONFile()
    func getContactsList() -> [Contact]
    func addNewContactWith(_ input: ContactInputModel)
    func updateContactWith(_ input: ContactInputModel)
    func deleteContactWithId(_ id: String)
}
