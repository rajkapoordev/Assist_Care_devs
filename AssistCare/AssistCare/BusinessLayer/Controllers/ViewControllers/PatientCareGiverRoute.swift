//
//  PatientCareGiverRoute.swift
//  AssistCare
//
//  Created by LaNet on 2/2/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import MapKit

class PatientCareGiverRoute: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextViewDelegate {
    @IBOutlet var scrollView: UIScrollView!

    
    @IBOutlet var txtVwInstruction: UITextView!
    @IBOutlet var btnSkip: UIButton!
    @IBOutlet var lbWhatWentWrong: UILabel!
    @IBOutlet var lbTimeWentWrong: UILabel!
    @IBOutlet var lbNameWentWrong: UILabel!
    @IBOutlet var imgProfileWentWrong: UIImageView!
    @IBOutlet var vwPopupWentWrong: UIView!
    @IBOutlet var tblView: UITableView!
    @IBOutlet var vWTop: UIView!
    @IBOutlet var mapView: MKMapView!
    
    @IBAction func btnSkip(_ sender: Any) {
        
    }
    
    let border = UIView()
    var header = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtVwInstruction.delegate = self
        vwPopupWentWrong.layer.cornerRadius = 5.0
        tblView.register(UINib(nibName:"MedicationPrompt",bundle : nil), forCellReuseIdentifier: "MedicationPrompt")
        scrollView.contentSize = CGSize(width: 0, height: (vWTop.frame.height + tblView.frame.height))

        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewDidLayoutSubviews() {
        vwPopupWentWrong.frame = CGRect(x: 20, y: (screenSize.height/2) - (self.vwPopupWentWrong.bounds.size.height / 2), width: screenSize.width - 40, height: self.vwPopupWentWrong.bounds.size.height)
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
  
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
        border.frame = CGRect(x: txtVwInstruction.frame.origin.x, y: txtVwInstruction.frame.origin.y+txtVwInstruction.frame.height-2, width: textView.frame.width, height: 2)
        border.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        txtVwInstruction.superview!.insertSubview(border, aboveSubview: textView)
        
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if txtVwInstruction.subviews.contains(border){
            border.removeFromSuperview()
        }
        let height = heightForView(text: txtVwInstruction.text, font: txtVwInstruction.font!, width: txtVwInstruction.frame.size.width)
        txtVwInstruction.frame = CGRect(x: txtVwInstruction.frame.origin.x, y: txtVwInstruction.frame.origin.y, width: txtVwInstruction.frame.size.width, height: height+10)
        
        border.frame = CGRect(x: txtVwInstruction.frame.origin.x, y: txtVwInstruction.frame.origin.y+txtVwInstruction.frame.height-2, width: textView.frame.width, height: 2)
        border.backgroundColor = appUIColorFromRGB(rgbValue: GREEN_COLOR, alpha: 1.0)
        txtVwInstruction.superview!.insertSubview(border, aboveSubview: textView)
    }

}
