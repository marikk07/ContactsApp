//
//  ContactListScreenViewController.swift
//  ContactsApp
//
//  Created by maryan on 11/10/2018.
//  Copyright © 2018 mp. All rights reserved.
//

import UIKit

class ContactListScreenViewController: UIViewController, ContactListScreenViewInput, ModuleInputProvider {

    // MARK: - ModuleInputProvider
    var moduleInitialInput: ModuleInput? {
        return self.output as? ModuleInput
    }

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var output: ContactListScreenViewOutput!
    private var contactsData: [Contact] = []
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        registerNibs()
        setupView()
    }

    // MARK: ContactListScreenViewInput
    func setupInitialState() {
    }
    
    func updateWithContacts(_ contactsData: [Contact]) {
        self.contactsData = contactsData
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    private func registerNibs() {
        let userCellNib = UINib(nibName: ContactListCell.nibName, bundle: nil)
        tableView.register(userCellNib, forCellReuseIdentifier: ContactListCell.reuseIdentifier)
    }
    
    private func setupView() {
        let titleLabel = UILabel(frame: CGRect.zero)
        titleLabel.text = "Contacts"
        titleLabel.sizeToFit()
        self.navigationItem.titleView = titleLabel
        
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actionAddButtonTouchUpInside(_:)))
        self.navigationItem.rightBarButtonItem = addBarButton
    }
    
    // MARK: - Actions
    @objc func actionAddButtonTouchUpInside(_ sender: UIBarButtonItem) {
        self.output.addButtonTouched()
    }
}

extension ContactListScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactListCell.reuseIdentifier) as? ContactListCell else {
            return UITableViewCell()
        }
        cell.configureWith(contactsData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let contactID = contactsData[indexPath.row].contactID {
            self.output.removeContactWith(id: contactID)
        }
        
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.output.editContact(contactsData[indexPath.row])
    }
    
}
