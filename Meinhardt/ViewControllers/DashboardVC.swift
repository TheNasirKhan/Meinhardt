//
//  LoginVC.swift
//  Meinhardt
//
//  Created by Nasir Khan on 18/06/2019.
//  Copyright © 2019 Nasir Khan. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController, UITableViewDelegate, UITableViewDataSource, RegisterButtonDelegate {
    
    
    
    @IBOutlet weak var vuSearch: UIView!
    @IBOutlet weak var table: UITableView!
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        self.vuSearch.round(radius: vuSearch.frame.height/2)
        
        
        events = [
            Event(
                title: "DESIGN & PERFORMANCE OF WATER DISTRIBUTION NETWORK",
                city: "Abu Dhabi, UAE",
                address: "Rotana Hotels Abu Dhabi - UAE",
                startDate: "22 April 2019",
                endDate: "25 April 2019",
                time: "9:00 AM",
                buttonTitle: "Register",
                image: "dashboardRectBG1"),
            
            Event(
                title: "PLANNING, DESIGN & MANAGEMENT OF RECYCLED WATER SYSTEMS",
                city: "Abu Dhabi, UAE",
                address: "Rotana Hotels Abu Dhabi - UAE",
                startDate: "28 April 2019",
                endDate: "1 May 2019",
                time: "9:00 AM",
                buttonTitle: "Register",
                image: "dashboardRectBG2"),
            
            Event(
                title: "MEINHARDT GLOBAL MANAGEMENT MEETING",
                city: "Singapore",
                address: "Four Seasons Hotel - Singapore",
                startDate: "20 April 2019",
                endDate: "",
                time: "9:00 AM",
                buttonTitle: "Register",
                image: "dashboardRectBG3")
        
        ]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DashboardCell
        
        let event = events[indexPath.row]
        
        cell.lblTitle.text = event.title
        cell.lblCity.text = event.city
        cell.lblAdress.text = event.address
        cell.lblDates.text = event.startDate + " - " + event.endDate
        cell.lblTime.text = event.time
        cell.img.image = UIImage(named: event.image)
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        return cell
    }
    
    func btnTapped(at index: IndexPath, btn sender: UIButton) {
        print(index.row)
        self.performSegue(withIdentifier: "KnowledgeGapVC", sender: nil)
    }
    
    @IBAction func btnMenuAction(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}
