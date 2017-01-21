//
//  PaymentDetailVC.swift
//  AssistCare
//
//  Created by LaNet on 1/21/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class PaymentDetailVC: UIViewController {

    @IBOutlet var tblPayment: UITableView!
    
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
    }
    
    func addNewPaymentDetail() {
        let managePaymentVC = ManagePaymentMethodVC(nibName: "ManagePaymentMethodVC", bundle: nil)
        self.navigationController?.pushViewController(managePaymentVC, animated: true)
        
    }

}
