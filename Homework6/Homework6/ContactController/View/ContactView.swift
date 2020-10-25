// 
//  ContactView.swift
//  Homework6
//
//  Created by Олег Романов on 24.10.2020.
//

import UIKit

final class ContactView: UIView {
    // MARK: - Properties

    @IBOutlet private var nameLabel: UILabel!
    
    @IBOutlet private var surnameLabel: UILabel!
    
    @IBOutlet private var phoneNumberLabel: UILabel!
    
    @IBOutlet private var logoImageView: UIImageView!
    
    @IBOutlet private var firstBlockView: UIView!
    
    @IBOutlet private var secondBlockView: UIView!
    
    // MARK: - Xib Init

    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    // MARK: - Private methods

    private func commonInit() {
        setupStyle()
    }

    private func setupStyle() {
        firstBlockView.layer.cornerRadius = 12
        secondBlockView.layer.cornerRadius = 12
        logoImageView.layer.cornerRadius = logoImageView.bounds.width / 2 
    }

    // MARK: - Internal methods

    func displayContact(_ contact: Contact) {
        nameLabel.text = contact.firstName
        surnameLabel.text = contact.lastName
        phoneNumberLabel.text = contact.phoneNumber
    }
}
