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
    
    @IBOutlet weak var onboardingView: OnboardingViewClass!
    @IBOutlet weak var skipBtnOutlet: UIButton!
    
    var userData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
    }
    
    @IBAction func skipBtnPressed(_ sender: Any) {
        userData.set(true, forKey: "demoCompleted")
        userData.synchronize()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension OnboardViewController: PaperOnboardingDataSource, PaperOnboardingDelegate {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let bgOne = #colorLiteral(red: 0.9734469056, green: 0.4355008006, blue: 0.260989815, alpha: 1)
        let bgTwo = #colorLiteral(red: 0.9997629523, green: 0.7760336995, blue: 0.1678207517, alpha: 1)
        let bgThree = #colorLiteral(red: 0.3685051203, green: 0.7292535901, blue: 0.4907024503, alpha: 1)
        let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 25)!
        let descFont = UIFont(name: "AvenirNext-DemiBold", size: 18)!
        
        return [
            (#imageLiteral(resourceName: "export"), "Backup Your Contacts!", "With Export Contact you can easily back up your guide. Are you looking forward to backing up? Continue then...", #imageLiteral(resourceName: "active"), bgOne, textColor, textColor, titleFont, descFont),
            (#imageLiteral(resourceName: "contact"), "Backup is that easy", "With Export Contact you will forget about paid backups. Enjoy backup in two steps.", #imageLiteral(resourceName: "active"), bgTwo, textColor, textColor, titleFont, descFont),
            (#imageLiteral(resourceName: "csv"), "CSV? - VCARD?", "What extension do you want to back up? \n As CSV? As VCARD?", #imageLiteral(resourceName: "active"), bgThree, textColor, textColor, titleFont, descFont)
            ][index]
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            skipBtnOutlet.isHidden = false
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index != 2 {
            if skipBtnOutlet.isHidden == false {
                skipBtnOutlet.isHidden = true
            }
        }
    }
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        // TODO : ...
    }
}
