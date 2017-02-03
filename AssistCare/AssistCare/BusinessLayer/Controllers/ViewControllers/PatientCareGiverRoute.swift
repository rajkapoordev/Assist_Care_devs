//
//  PatientCareGiverRoute.swift
//  AssistCare
//
//  Created by LaNet on 2/2/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit
class PatientCareGiverRoute: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var scrollView: UIScrollView!

    @IBOutlet var tblView: UITableView!
    @IBOutlet var vWTop: UIView!
    @IBOutlet var mapView: MKMapView!
    var header = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName:"MedicationPrompt",bundle : nil), forCellReuseIdentifier: "MedicationPrompt")
        scrollView.contentSize = CGSize(width: 0, height: (vWTop.frame.height + tblView.frame.height))
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        tableView.frame = CGRect(x: tblView.frame.origin.x, y: tblView.frame.origin.y, width: tblView.frame.width, height: (101 * 10))
        scrollView.contentSize = CGSize(width: 0, height: (vWTop.frame.height + tblView.frame.height))
        //tblView.contentSize = CGSize(width: tblView.frame.width, height: 57 * 10 )
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationPrompt", for: indexPath) as! MedicationPrompt
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
