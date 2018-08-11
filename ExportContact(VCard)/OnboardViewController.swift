//
//  OnboardViewController.swift
//  ExportContact(VCard)
//
//  Created by Mustafa GUNES on 11.08.2018.
//  Copyright © 2018 Mustafa GUNES. All rights reserved.
//

import UIKit
import paper_onboarding

class OnboardViewController: UIViewController {

    @IBOutlet weak var skipButtonOutlet: UIButton!
    @IBOutlet weak var onboardingView: OnboardingViewClass!
    
    var userData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.delegate = self
        onboardingView.dataSource = self
    }
    
    @IBAction func skipButtonPressed(_ sender: Any) {
        userData.set(true, forKey: "demoCompleted")
        userData.synchronize()
    }
}
