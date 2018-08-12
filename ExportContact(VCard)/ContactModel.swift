//
//  ContactModel.swift
//  ExportContact(VCard)
//
//  Created by Mustafa GUNES on 11.08.2018.
//  Copyright © 2018 Mustafa GUNES. All rights reserved.
//

import Contacts
import ContactsUI
import Foundation

class ContactModel {
    
    var fetchingContactsCallback: ((Int) -> Void)?
    var exportingContactsCallback: ((URL) -> Void)?
    var contacts = [CNContact]()
    
    init() {
    }
    
    func fetchContactList() {
        let store = CNContactStore()
        let keysToFech = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
        
        do {
            let request = CNContactFetchRequest(keysToFetch: keysToFech as [CNKeyDescriptor])
            try store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                self.contacts.append(contact)
            })
            fetchingContactsCallback!(self.contacts.count)
            //self.quantity.text = "\(String(describing: self.contacts!.count)) contacts"
            self.contacts.forEach{ (contact) in
                print(contact.phoneNumbers.count)
            }
            print(self.contacts.count)
        } catch is NSError {
            print("Cant fetch contacts")
        }
    }
    
    func exportContacts() {
        let fileName = "contacts.vcard"
        var fileText = "Name, Given Name, Family Name, Phone 1 - Type, Phone 1 - Value"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        contacts.forEach { (contact) in
            if let number = contact.phoneNumbers.first?.value.stringValue {
                print(number)
                fileText.append("\n\(contact.givenName),\(contact.givenName),\(contact.familyName),Mobile,\(number)")
            }
        }
        
        do {
            try fileText.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
            exportingContactsCallback!(path!)
        }
        catch {
            print("Failed to create file")
            print("\(error)")
        }
    }
}
