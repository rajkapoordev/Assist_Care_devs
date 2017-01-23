//
//  PaymentDetailVC.swift
//  AssistCare
//
//  Created by LaNet on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PaymentDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblPaymentCardDetail: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setInterface() {
        self.navigationController?.navigationBar.isHidden = false
        self.automaticallyAdjustsScrollViewInsets = false
        
        //Right bar button
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "add_button.png"), for: .normal)
        button.addTarget(self, action:#selector(self.addNewPaymentDetail), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 25, height: 25)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        
        self.view.backgroundColor = appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1.0)
        //register nib
        tblPaymentCardDetail.register(UINib(nibName: "PaymentDetailCell", bundle:nil), forCellReuseIdentifier: "PaymentDetailCell")
        tblPaymentCardDetail.dataSource = self
        tblPaymentCardDetail.delegate = self
        tblPaymentCardDetail.tableFooterView = UIView()
        self.tblPaymentCardDetail.separatorStyle = .none
        tblPaymentCardDetail.backgroundColor = appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1.0)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentDetailCell", for: indexPath) as! PaymentDetailCell
        let lineView = UIView(frame: CGRect(x: 0, y: 60, width: ScreenSize.SCREEN_WIDTH, height: 5))
        lineView.backgroundColor = appUIColorFromRGB(rgbValue: BACK_COLOR, alpha: 1.0)
        cell.contentView.addSubview(lineView)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let managePaymentVC = ManagePaymentMethodVC(nibName: "ManagePaymentMethodVC", bundle: nil)
        self.navigationController?.pushViewController(managePaymentVC, animated: true)
    }

    func addNewPaymentDetail() {
        let managePaymentVC = ManagePaymentMethodVC(nibName: "ManagePaymentMethodVC", bundle: nil)
        self.navigationController?.pushViewController(managePaymentVC, animated: true)
    }

}
