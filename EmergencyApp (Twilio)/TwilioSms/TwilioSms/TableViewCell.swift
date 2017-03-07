//
//  TableViewCell.swift
//  TwilioSms
//
//  Created by Emily on 3/1/17.
//  Copyright © 2017 Twilio. All rights reserved.
//

import UIKit
import APAddressBook

class TableViewCell: UITableViewCell {
    
    // MARK: - life cycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - ModelTransfer
    
    func update(with model: APContact) {
        imageView?.image = model.thumbnail
        textLabel?.text = contactName(model)
        detailTextLabel?.text = contactPhones(model)
    }
    
    // MARK: - prviate
    
    func contactName(_ contact :APContact) -> String {
        if let firstName = contact.name?.firstName, let lastName = contact.name?.lastName {
            return "\(firstName) \(lastName)"
        }
        else if let firstName = contact.name?.firstName {
            return "\(firstName)"
        }
        else if let lastName = contact.name?.lastName {
            return "\(lastName)"
        }
        else {
            return "Unnamed contact"
        }
    }
    
    func contactPhones(_ contact :APContact) -> String {
        if let phones = contact.phones {
            var phonesString = ""
            for phone in phones {
                if let number = phone.number {
                    phonesString = phonesString + " " + number
                }
            }
            return phonesString
        }
        return "No phone"
    }
}
