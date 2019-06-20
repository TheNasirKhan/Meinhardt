//
//  LoginVC.swift
//  Meinhardt
//
//  Created by Nasir Khan on 18/06/2019.
//  Copyright © 2019 Nasir Khan. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var vuMiddle: UIView!
    @IBOutlet weak var btnAtendee: UIButton!
    @IBOutlet weak var btnSpeaker: UIButton!
    @IBOutlet weak var btnSignin: UIButton!
    
    var isAtendee = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        self.vuMiddle.round(radius: 10)
        self.btnSignin.round(radius: 5)
        self.btnSignin.dropShadow()
    }
    
    
    @IBAction func btnAtendeeAction(_ sender: Any) {
        toggleUserType(isAttendeeFlag: true)
    }
    
    @IBAction func btnSpeakerAction(_ sender: Any) {
        toggleUserType(isAttendeeFlag: false)
    }
    
    @IBAction func btnSigninAction(_ sender: Any) {
        self.performSegue(withIdentifier: "DashboardVC", sender: nil)
    }
    
    func toggleUserType(isAttendeeFlag: Bool) {
        isAtendee = isAttendeeFlag
        let checkedImage = UIImage(named: "checked")
        let unCheckedImage = UIImage(named: "unchecked")
        
        if isAttendeeFlag {
            self.btnAtendee.setImage(checkedImage, for: .normal)
            self.btnSpeaker.setImage(unCheckedImage, for: .normal)
        } else {
            self.btnAtendee.setImage(unCheckedImage, for: .normal)
            self.btnSpeaker.setImage(checkedImage, for: .normal)
        }
        
    }
    
}
