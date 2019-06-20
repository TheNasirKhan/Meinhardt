//
//  DashboardCell.swift
//  Meinhardt
//
//  Created by Nasir Khan on 19/06/2019.
//  Copyright © 2019 Nasir Khan. All rights reserved.
//

import UIKit

protocol RegisterButtonDelegate{
    func btnTapped(at index:IndexPath, btn sender:UIButton)
}

class DashboardCell : UITableViewCell {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblAdress: UILabel!
    @IBOutlet var lblDates: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet weak var vuButton: UIView!
    @IBOutlet weak var btnRegister: UIButton!
    
    var delegate:RegisterButtonDelegate!
    var indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.vuButton.roundToHalfHeight()
        self.vuButton.layer.borderWidth = 1
        self.vuButton.layer.borderColor = UIColor.white.cgColor
    }
    
    // Inside UITableViewCell subclass
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        self.delegate?.btnTapped(at: indexPath, btn: sender)
    }
}

struct Event {
    var title: String
    var city: String
    var address: String
    var startDate: String
    var endDate: String
    var time: String
    var buttonTitle: String
    var image: String
}
