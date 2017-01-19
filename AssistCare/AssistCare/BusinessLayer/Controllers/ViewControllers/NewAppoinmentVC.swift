//
//  NewAppoinmentVC.swift
//  AssistCare
//
//  Created by developer91 on 1/18/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit

class NewAppoinmentVC: UIViewController {

    @IBOutlet var collAssistServices: UICollectionView!
    @IBOutlet var collPrefferedServices: UICollectionView!
    @IBOutlet var scrollNewAppoinment: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.setInterface()
    }
    
    func setInterface(){
        let backButton = UIBarButtonItem(
            title: "New Appoinment",
            style: UIBarButtonItemStyle.bordered,
            target: nil,
            action: nil
        );
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton;
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = getGreenColor()
        scrollNewAppoinment.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: 900)
    }


}
