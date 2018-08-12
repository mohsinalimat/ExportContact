//
//  ViewController.swift
//  ExportContact(VCard)
//
//  Created by Mustafa GUNES on 11.08.2018.
//  Copyright © 2018 Mustafa GUNES. All rights reserved.
//

import UIKit
import SwiftyButton

class HomeScreen: UIViewController {

    // OUTLET'S
    @IBOutlet weak var exportButton: PressableButton!
    @IBOutlet weak var loadContactButton: PressableButton!
    
    private var model = ContactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO : Kişileri getir denildiğinde alert ile ekrana kaç kişi olduğunu göstert.
        buttonColorSet()
        model.fetchingContactsCallback = updateLabelFetchingCallback
        model.exportingContactsCallback = exportToCSV_VCARDCallback
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func exportToCSV_VCARDCallback(path: URL) {
        let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }
    
    func buttonColorSet() {
        exportButton.colors = .init(button: UIColor(red:0.29, green:0.62, blue:0.26, alpha:1.0), shadow: UIColor(red:0.25, green:0.53, blue:0.22, alpha:1.0))
        loadContactButton.colors = .init(button: UIColor(red:0.87, green:0.29, blue:0.25, alpha:1.0), shadow: UIColor(red:0.75, green:0.22, blue:0.17, alpha:1.0))
    }
    
    @IBAction func loadButtonPressed(_ sender: Any) {
        model.fetchContactList()
        loadContactButton.isEnabled = false
        loadContactButton.setTitle("Contacts Loaded", for: .normal)
    }
    
    @IBAction func exportButtonPressed(_ sender: Any) {
        fileExtension()
    }
    
    func updateLabelFetchingCallback(numberOfContact: Int){
        let alertContactsCount = UIAlertController(title: "Contacts Count : \(numberOfContact)", message: "Next Step : Export Button Pressed", preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertContactsCount.addAction(OK)
        self.present(alertContactsCount, animated: true, completion: nil)
    }
    
    func fileExtension() {
        let alertController = UIAlertController(title: "Deneme", message: "alertMessage", preferredStyle: .actionSheet)
        
        let VCARD = UIAlertAction(title: "VCARD (Recommend)", style: .default) { (alert) in
            self.model.fileExtension = ".vcard"
            self.model.exportContacts()
            print("VCARD")
            self.exportButton.setTitle("Exported as VCARD", for: .normal)
        }
        let CSV = UIAlertAction(title: "CSV", style: .default) { (alert2) in
            self.model.fileExtension = ".csv"
            self.model.exportContacts()
            print("CSV")
            self.exportButton.setTitle("Exported as CSV", for: .normal)
        }
        let alertCancel = UIAlertAction(title: "CLOSE", style: .destructive, handler: nil)
        
        alertController.addAction(CSV)
        alertController.addAction(VCARD)
        alertController.addAction(alertCancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
