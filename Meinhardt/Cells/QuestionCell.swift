//
//  DashboardCell.swift
//  Meinhardt
//
//  Created by Nasir Khan on 19/06/2019.
//  Copyright © 2019 Nasir Khan. All rights reserved.
//

import UIKit

protocol QuestionButtonDelegate{
    func btn1Tapped(at index:IndexPath, btn sender:UIButton)
    func btn2Tapped(at index:IndexPath, btn sender:UIButton)
    func btn3Tapped(at index:IndexPath, btn sender:UIButton)
    func btn4Tapped(at index:IndexPath, btn sender:UIButton)
}

class QuestionCell : UITableViewCell {
    
    @IBOutlet weak var btna: UIButton!
    @IBOutlet weak var btnb: UIButton!
    @IBOutlet weak var btnc: UIButton!
    @IBOutlet weak var btnd: UIButton!
    
    var delegate:QuestionButtonDelegate!
    var indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    // Inside UITableViewCell subclass
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    @IBAction func btn1Action(_ sender: UIButton) {
        self.delegate?.btn1Tapped(at: indexPath, btn: sender)
    }
    
    @IBAction func btn2Action(_ sender: UIButton) {
        self.delegate?.btn2Tapped(at: indexPath, btn: sender)
    }
    
    @IBAction func btn3Action(_ sender: UIButton) {
        self.delegate?.btn3Tapped(at: indexPath, btn: sender)
    }
    
    @IBAction func btn4Action(_ sender: UIButton) {
        self.delegate?.btn4Tapped(at: indexPath, btn: sender)
    }
}

struct Question {
    var answer: Answers
}

enum Answers {
    case a
    case b
    case c
    case d
}



protocol SubmitButtonDelegate{
    func btnTapped(at index:IndexPath, btn sender:UIButton)
}


class SubmitCell : UITableViewCell {
    
    @IBOutlet var txt: UITextView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    var delegate:SubmitButtonDelegate!
    var indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.btnSubmit.round(radius: 5)
        self.btnSubmit.dropShadow()
        
        self.txt.round(radius: 5)
        self.txt.layer.borderWidth = 1
        self.txt.layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        self.delegate?.btnTapped(at: indexPath, btn: sender)
    }
}
