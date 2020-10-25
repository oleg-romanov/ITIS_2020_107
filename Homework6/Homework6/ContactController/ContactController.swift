// 
//  ContactController.swift
//  Homework6
//
//  Created by Олег Романов on 24.10.2020.
//

import UIKit

class ContactController: UIViewController {
    // MARK: - Properties

    private lazy var customView: ContactView? = view as? ContactView

    // MARK: - Init

    public init(contact: Contact) {
        super.init(
            nibName: "ContactView",
            bundle: Bundle(for: ContactView.self)
        )
        setupAppearance(contact: contact)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupAppearance(contact: Contact) {
        title = contact.firstName
        customView?.displayContact(contact)
    }
}
