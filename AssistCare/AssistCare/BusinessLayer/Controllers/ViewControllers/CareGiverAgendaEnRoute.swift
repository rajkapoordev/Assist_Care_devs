//
//  CareGiverAgendaEnRoute.swift
//  AssistCare
//
//  Created by developer91 on 2/7/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CareGiverAgendaEnRoute: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var tblUpcomingEvents: UITableView!
    @IBOutlet var vwCarePlan: UIView!
    @IBOutlet var btnCarePlan: UIButton!
    @IBOutlet var vwInfo: UIView!
    @IBOutlet var vwNavigationBar: UIView!
    @IBOutlet var vwStatusBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInterface()
    }

    override func viewWillAppear(_ animated: Bool) {
        setInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setInterface(){
        self.tblUpcomingEvents.delegate = self
        self.tblUpcomingEvents.dataSource = self
        self.tblUpcomingEvents.register(UINib(nibName: "CareGiverAgendaCell", bundle: nil), forCellReuseIdentifier: "CareGiverAgendaCell")
        vwCarePlan.backgroundColor = AppColor.skyColor
        self.view.backgroundColor = AppColor.backColor
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        imgProfile.setRounded()
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CareGiverAgendaCell", for: indexPath) as! CareGiverAgendaCell
        return cell
    }
    
    @IBAction func btnCarePlan(_ sender: Any) {
        
    }
    
}
