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
        
        model.exportingContactCallback = exportToCSV_VCARDCallback
        buttonColorSet()
        //buttonCreate_SetupLayout()
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
    
    func buttonAddTarget() {
        exportButton.addTarget(nil, action: #selector(self.exportButtonPressed), for: .touchUpInside)
        loadContactButton.addTarget(nil, action: #selector(self.loadButtonPressed), for: .touchUpInside) // UIAlert çalıştırarak seçilen satıra göre işlem yapacak.
    }

    @objc func exportButtonPressed() {
        fileExtension()
    }
    
    @objc func loadButtonPressed() {
        
        // TODO : alertaction'da neye basarsa onun uzantısını alacak.
    }
    
    func fileExtension() {
        let alertController = UIAlertController(title: "Deneme", message: "alertMessage", preferredStyle: .actionSheet)
        
        let alert = UIAlertAction(title: "VCARD", style: .default) { (alert) in
            print("alert1 çalışıyor")
        }
        let alert2 = UIAlertAction(title: "CSV", style: .default) { (alert2) in
            print("alert2 çalışıyor")
        }
        let alertCancel = UIAlertAction(title: "CLOSE", style: .destructive, handler: nil)
        
        alertController.addAction(alert)
        alertController.addAction(alert2)
        alertController.addAction(alertCancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
