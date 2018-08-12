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
        colorSet()
        //buttonCreate_SetupLayout()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func exportToCSV_VCARDCallback(path: URL) {
        let vc = UIActivityViewController(activityItems: [path], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }
    
    func colorSet() {
        exportButton.colors = .init(button: UIColor(red:0.29, green:0.62, blue:0.26, alpha:1.0), shadow: UIColor(red:0.25, green:0.53, blue:0.22, alpha:1.0))
        loadContactButton.colors = .init(button: UIColor(red:0.87, green:0.29, blue:0.25, alpha:1.0), shadow: UIColor(red:0.75, green:0.22, blue:0.17, alpha:1.0))
    }
    
    func buttonCreate_SetupLayout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            let pressButton = PressableButton()
            pressButton.shadowHeight = 5
            //pressButton.cornerRadius = 5
            pressButton.setTitle("Kişileri Getir", for: .normal)
            pressButton.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 50)
            //pressButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50) // Font boyutu
            pressButton.frame = CGRect(x: 153, y: 318, width: 200, height: 100)
            pressButton.colors = .init(button: UIColor(red:0.87, green:0.29, blue:0.25, alpha:1.0), shadow: UIColor(red:0.75, green:0.22, blue:0.17, alpha:1.0))
            
            pressButton.addTarget(nil, action: #selector(self.pressButtonPressed), for: .touchUpInside)
            
            let pressButton2 = PressableButton()
            pressButton2.shadowHeight = 5
            pressButton2.setTitle("Yedekle", for: .normal)
            pressButton2.frame = CGRect(x: 153, y: 318, width: 200, height: 100)
            pressButton2.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 50)
            pressButton2.colors = .init(button: UIColor(red:0.29, green:0.62, blue:0.26, alpha:1.0), shadow: UIColor(red:0.25, green:0.53, blue:0.22, alpha:1.0))
            
            pressButton2.addTarget(nil, action: #selector(self.pressButton2Pressed), for: .touchUpInside) // UIAlert çalıştırarak seçilen satora göre işlem yapacak.
            
            self.view.addSubview(pressButton)
            self.view.addSubview(pressButton2)
            
            pressButton.translatesAutoresizingMaskIntoConstraints = false
            pressButton.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            pressButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            pressButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            pressButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
            pressButton.heightAnchor.constraint(equalToConstant: 368).isActive = true
            
            
            pressButton2.translatesAutoresizingMaskIntoConstraints = false
            pressButton2.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            pressButton2.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            pressButton2.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            pressButton2.widthAnchor.constraint(equalToConstant: 200).isActive = true
            pressButton2.heightAnchor.constraint(equalToConstant: 368).isActive = true
        }
    }
    
    @objc func pressButtonPressed() {
        // TODO : alertaction'da neye basarsa onun uzantısını alacak.
    }
    
    @objc func pressButton2Pressed() {
        multiAlert()
    }
    
    func multiAlert() {
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
