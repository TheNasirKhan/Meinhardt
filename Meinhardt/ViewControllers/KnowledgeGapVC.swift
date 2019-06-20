//
//  KnowledgeGapVC.swift
//  Meinhardt
//
//  Created by Nasir Khan on 20/06/2019.
//  Copyright © 2019 Nasir Khan. All rights reserved.
//

import UIKit

class KnowledgeGapVC: UIViewController, UITableViewDelegate, UITableViewDataSource, QuestionButtonDelegate {
    
    var questions = [Question]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = [
            
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a),
            Question(answer: Answers.a)
            
        ]
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            
            return cell
        case questions.count + 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! SubmitCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! QuestionCell
            
            let answer = questions[indexPath.row - 1].answer
            let imgChecked = UIImage(named: "checked")
            let imgUnchecked = UIImage(named: "unchecked")
            
            cell.btna.setImage(imgUnchecked, for: .normal)
            cell.btnb.setImage(imgUnchecked, for: .normal)
            cell.btnc.setImage(imgUnchecked, for: .normal)
            cell.btnd.setImage(imgUnchecked, for: .normal)
            
            switch answer {
            case .a:
                cell.btna.setImage(imgChecked, for: .normal)
            case .b:
                cell.btnb.setImage(imgChecked, for: .normal)
            case .c:
                cell.btnc.setImage(imgChecked, for: .normal)
            case .d:
                cell.btnd.setImage(imgChecked, for: .normal)
            }
            
            cell.indexPath = indexPath
            cell.delegate = self
            
            return cell
        }
        
    }
    
    
    func btn1Tapped(at index: IndexPath, btn sender: UIButton) {
        questions[index.row - 1].answer = Answers.a
        self.table.reloadData()
    }
    
    func btn2Tapped(at index: IndexPath, btn sender: UIButton) {
        questions[index.row - 1].answer = Answers.b
        self.table.reloadData()
    }
    
    func btn3Tapped(at index: IndexPath, btn sender: UIButton) {
        questions[index.row - 1].answer = Answers.c
        self.table.reloadData()
    }
    
    func btn4Tapped(at index: IndexPath, btn sender: UIButton) {
        questions[index.row - 1].answer = Answers.d
        self.table.reloadData()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
