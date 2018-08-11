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

extension OnboardViewController: PaperOnboardingDelegate, PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let bgOne = #colorLiteral(red: 0.9734469056, green: 0.4355008006, blue: 0.260989815, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.9997629523, green: 0.7760336995, blue: 0.1678207517, alpha: 1)
        let bgThree = #colorLiteral(red: 0.3685051203, green: 0.7292535901, blue: 0.4907024503, alpha: 1)
        let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return [
        ][index]
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            skipButtonOutlet.isHidden = false
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index != 2 {
            if skipButtonOutlet.isHidden == false {
                skipButtonOutlet.isHidden = true
            }
        }
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        // TODO : ...
    }
}
