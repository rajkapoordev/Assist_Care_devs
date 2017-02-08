//
//  CarePlanVC.swift
//  AssistCare
//
//  Created by LaNet on 1/31/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class CarePlanVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var vwStatusBar: UIView!
    
    //view Rating
    
    @IBOutlet var vwRating: UIView!
    @IBOutlet var vwSubRating: UIView!
    @IBOutlet var vwProfileInfo: UIView!
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var vwRateBooking: UIView!
    
    //view Finish Appoinment
    
    @IBOutlet var lbFinishDescription: UILabel!
    @IBOutlet var vwFinishAppoinment: UIView!
    @IBOutlet var vwSubFinishAppoinment: UIView!
    @IBOutlet var btnNevermindAppoinment: UIButton!
    @IBOutlet var btnFinishEarly: UIButton!
    @IBOutlet var lbFinishAppoinment: UILabel!
    
   //view Finish Services
    
    @IBOutlet var vwFinishServices: UIView!
    @IBOutlet var vwSubFinishServices: UIView!
    @IBOutlet var btnNevermind: UIButton!
    @IBOutlet var btnFinish: UIButton!
    @IBOutlet var lbFinishServiceEarly: UILabel!
    @IBOutlet var lbDescription: UILabel!
    @IBOutlet var lbNameOfMedication: UILabel!
    @IBOutlet var lbTimeforMedicine: UILabel!
    @IBOutlet var btnCheck: UIButton!
    
    //Navigation Bar
    @IBOutlet var btnNavBack: UIButton!
    @IBOutlet var vwNavBar: UIView!
    @IBOutlet var lblNavTitle: UILabel!
    
    @IBOutlet var imgProfile: UIImageView!
    @IBOutlet var tblView: UITableView!
    var customView = UIView()
    var headerTitle = NSMutableArray()
    var isArrExpand = NSMutableArray()
    var reference = NSMutableArray()
    var subTitle = NSMutableArray()
    var checked:Bool = false
    
    @IBOutlet var vWPopup: UIView!
    
    var str = "The table view is not reloaded after the move operation - UITableView trusts you to change the underlying model list accordingly. If you have a bug in your implementation, the UI will show the moved cell as moved by the user, but the data object will have a different order. To check for the correctness of your implementation, use NSLog or reload the table after the move "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue()
        addCustomeView()
        setInterface()
        tblView.tableFooterView = customView
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func btnCheckClick(_ sender: UIButton) {
    }
    
    
    @IBAction func btnNevermindClick(_ sender: UIButton) {
    }
    
    
    @IBAction func btnFinishClick(_ sender: UIButton) {
    }
    
    
    
    func setInterface() {
        self.navigationController?.navigationBar.isHidden = true
        vwStatusBar.backgroundColor = AppColor.redStatusBar
        vwNavBar.backgroundColor = AppColor.redColor
        lblNavTitle.textColor = UIColor.white

       // self.vWPopup.layer.cornerRadius = 5;
        let transperentView = UIView(frame: UIScreen.main.bounds)
        transperentView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.35)
        imgProfile.setRounded()
        
            self.setFinishEarlyPopup()
            self.setFinishAppoinmentPopup()
            self.setRating()
            //self.view.addSubview(vwRating)
        
        
           /* vWPopup.layer.shadowColor = UIColor.gray.cgColor
            vWPopup.layer.shadowOpacity = 2
            vWPopup.layer.shadowOffset = CGSize.zero
            vWPopup.layer.shadowRadius = 5
            
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.btnNevermind.frame
            rectShape.position = self.btnNevermind.center
            rectShape.path = UIBezierPath(roundedRect: self.btnNevermind.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
            self.btnNevermind.layer.backgroundColor = AppColor.skyColor.cgColor
            self.btnNevermind.layer.mask = rectShape
            
            rectShape.bounds = self.btnFinish.frame
            rectShape.position = self.btnFinish.center
            rectShape.path = UIBezierPath(roundedRect: self.btnFinish.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 5, height: 5)).cgPath
            self.btnFinish.layer.backgroundColor = AppColor.skyColor.cgColor
            self.btnFinish.layer.mask = rectShape
        }*/
    }
    
    func setValue()
    {
        headerTitle.add("Meal Preparation")
        headerTitle.add("Medication Prompt")
        headerTitle.add("Patient Progress")
        subTitle.add("Meal preparation instructions")
        subTitle.add("Medication administration insructions")
        subTitle.add("Notes from past visits")
        for _ in 0..<headerTitle.count
        {
            isArrExpand.add(false)
        }
    }
    
    func setFinishEarlyPopup(){
        vwSubFinishServices.layer.cornerRadius = 5.0
        btnFinish.roundedBottomRightButton()
        btnNevermind.roundedBottomLeftButton()
        lbDescription.frame = CGRect(x: self.lbDescription.frame.origin.x, y: self.lbDescription.frame.origin.y, width: self.lbDescription.bounds.size.width, height: heightForView(text: lbDescription.text!, font: lbDescription.font, width: self.lbDescription.bounds.size.width))
        btnNevermind.backgroundColor = UIColor.white
        btnFinish.backgroundColor = AppColor.skyColor
        btnNevermind.setTitleColor(AppColor.skyColor, for: .normal)
        btnFinish.setTitleColor(UIColor.white, for: .normal)
        btnCheck.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "Checked"), scaledToSize: CGSize(width: btnCheck.bounds.size.width, height: btnCheck.bounds.size.height)), for: .normal)
    }
    
    func setFinishAppoinmentPopup(){
        vwSubFinishAppoinment.layer.cornerRadius = 5.0
        btnFinishEarly.roundedBottomRightButton()
        btnNevermindAppoinment.roundedBottomLeftButton()
        lbFinishDescription.frame = CGRect(x: self.lbFinishDescription.frame.origin.x, y: self.lbFinishDescription.frame.origin.y, width: self.lbFinishDescription.bounds.size.width, height: heightForView(text: lbFinishDescription.text!, font: lbFinishDescription.font, width: self.lbFinishDescription.bounds.size.width))
        btnNevermindAppoinment.backgroundColor = UIColor.white
        btnFinishEarly.backgroundColor = AppColor.redColor
        btnNevermindAppoinment.setTitleColor(AppColor.redColor, for: .normal)
        btnFinishEarly.setTitleColor(UIColor.white, for: .normal)
    }
    
    
    func setRating(){
        vwSubRating.layer.cornerRadius = 5.0
        btnSubmit.roundedBottomLeftButton()
        btnSubmit.roundedBottomRightButton()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isArrExpand[section] as! Bool == true)
        {
            
            return 1
            
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1
        {
            tblView.register(UINib(nibName:"MedicationPrompt",bundle : nil), forCellReuseIdentifier: "MedicationPrompt")
            let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationPrompt", for: indexPath) as! MedicationPrompt
            if(checked == true){
                cell.btnCkeck.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "Checked"), scaledToSize: CGSize(width: btnCheck.bounds.size.width, height: btnCheck.bounds.size.height)), for: .normal)
                cell.imgStatus.image = imageWithImage(#imageLiteral(resourceName: "Correct"), scaledToSize: CGSize(width: cell.imgStatus.bounds.size.width, height: cell.imgStatus.bounds.size.height))
            }else{
                cell.btnCkeck.setBackgroundImage(imageWithImage(#imageLiteral(resourceName: "Unchecked"), scaledToSize: CGSize(width: btnCheck.bounds.size.width, height: btnCheck.bounds.size.height)), for: .normal)
                cell.imgStatus.image = imageWithImage(#imageLiteral(resourceName: "Incorrect"), scaledToSize: CGSize(width: cell.imgStatus.bounds.size.width, height: cell.imgStatus.bounds.size.height))
            }
            //            cell.lblDescription.text = str
            //            cell.lblDescription.numberOfLines = 0
            //            cell.lblDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
            //            cell.lblDescription.sizeToFit()
            return cell
            
        }else if indexPath.section == 2
        {
            tblView.register(UINib(nibName:"CareGiverAgendaCell",bundle : nil), forCellReuseIdentifier: "CareGiverAgendaCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CareGiverAgendaCell", for: indexPath) as! CareGiverAgendaCell
            cell.btnMsg.isHidden =   true
            cell.lbDate.isHidden = false
            cell.lbDate.text = "Feb.28"
            return cell
            
        }
        else
        {
            tblView.register(UINib(nibName:"MealPreparation",bundle : nil), forCellReuseIdentifier: "MealPreparation")
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealPreparation", for: indexPath) as! MealPreparation
            cell.lblDescription.text = str
            cell.lblDescription.numberOfLines = 0
            cell.lblDescription.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.lblDescription.sizeToFit()
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            let cell = tableView.cellForRow(at: indexPath) as! CareGiverAgendaCell
            var name = cell.lblName.text
            let vc = CareGiverChartViewProgressVC(nibName: "CareGiverChartViewProgressVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: false)
            
        }else if indexPath.section == 1{
            if(checked == true){
                checked = false
                tblView.reloadData()
            }else{
                checked = true
                tblView.reloadData()
            }
            
        }
       /* let vwMain = UIView()
        vwMain.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: ScreenSize.SCREEN_HEIGHT)
        vWPopup.center = CGPoint(x: vwMain.frame.size.width  / 2, y: vwMain.frame.size.height / 2)
        vwMain.addSubview(vWPopup)
        appDelegate().window?.addSubview(vwMain)*/
        //        self.view.addSubview(vwMain)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return 60
        }else{
            return str.height(constraintedWidth: tableView.frame.size.width, font: UIFont.systemFont(ofSize: 15)) - 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        headerView.clipsToBounds = true
        headerView.backgroundColor = UIColor.white
        let lbtitle = UILabel()
        lbtitle.frame = CGRect(x: 10, y: 5, width: ScreenSize.SCREEN_WIDTH/2 + 50, height: CGFloat(20))
        lbtitle.font = lbtitle.font.withSize(14)
        lbtitle.numberOfLines = 0
        // lbtitle.backgroundColor = UIColor.blue
        lbtitle.text = "Hello"
        lbtitle.text = headerTitle[section] as? String
        
        let lblSubDescription = UILabel()
        lblSubDescription.frame = CGRect(x: 10, y:lbtitle.frame.origin.y + lbtitle.frame.height , width: ScreenSize.SCREEN_WIDTH/2 + 50, height: 20)
        lblSubDescription.font = lblSubDescription.font.withSize(10)
        
        lblSubDescription.text = subTitle[section] as? String
        headerView.addSubview(lblSubDescription)
        
        
        headerView.addSubview(lbtitle)
        let imgArrow = UIImageView()
        imgArrow.frame = CGRect(x: ScreenSize.SCREEN_WIDTH - 40, y: 5, width: 20, height: 20)
        if (isArrExpand[section] as! Bool)
        {
            imgArrow.image = UIImage(named:"Checked.png")
        }
        else{
            imgArrow.image = UIImage(named:"Unchecked.png")
        }
        let btnClick = UIButton()
        btnClick.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 40)
        
        btnClick.backgroundColor = UIColor.clear
        btnClick.addTarget(self, action: #selector(CreateProfileSecond.btnClick(sender:)), for: .touchUpInside)
        btnClick.tag = section
        headerView.addSubview(imgArrow)
        headerView.addSubview(btnClick)
        return headerView
    }
    
    @IBAction func btnNavBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    func btnClick(sender:UIButton)
    {
        let isExp = isArrExpand[sender.tag] as! Bool
        isArrExpand.replaceObject(at: sender.tag, with: !isExp)
        //isArrExpand[sender.tag] = !isExp
        
        let indexSet = NSIndexSet(index: sender.tag)
        tblView.reloadSections(indexSet as IndexSet, with: .fade)
        
        
        
    }
    
    func addCustomeView()
    {
        customView.frame = CGRect(x: 0, y: 20, width: ScreenSize.SCREEN_WIDTH, height: 50)
        // customView.backgroundColor = UIColor.red
        
        
        let btnEndServiceEarly = UIButton(frame: CGRect(x: 30, y: 0, width: customView.frame.width - 60 , height: 40))
        btnEndServiceEarly.setTitle("END SERVICE EARLY", for: .normal)
        btnEndServiceEarly.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
        btnEndServiceEarly.titleLabel?.textColor = UIColor.red
        btnEndServiceEarly.backgroundColor = AppColor.backColor
        btnEndServiceEarly.shadow()
        customView.addSubview(btnEndServiceEarly)
        
    }
    
    func nextClick()
    {
        let vc = CareGiverAgendaEnRoute(nibName: "CareGiverAgendaEnRoute", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension String {
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.sizeToFit()
        
        return label.frame.height
    }
}

