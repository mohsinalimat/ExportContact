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
    
    var fetchingContactCallback: ((Int) -> Void)?
    var exportingContactCallback: ((URL) -> Void)?
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
            fetchingContactCallback!(self.contacts.count)
            //self.quantity.text = "\(String(describing: self.contacts!.count)) contacts"
            self.contacts.forEach{ (contact) in
                print(contact.phoneNumbers.count)
            }
            print(self.contacts.count)
        } catch is NSError {
            print("Cant fetch contacts")
        }
    }
}
