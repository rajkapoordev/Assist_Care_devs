//
//  EventView.swift
//  Demos
//
//  Created by Dominik Pich on 13/10/15.
//  Copyright © 2015 Dominik Pich. All rights reserved.
//

import UIKit
import EventKit

class EventView: DDCalendarEventView {
    override var active : Bool {
        didSet {
            let c = UIColor(red: 182/255, green: 220/255, blue: 212/255, alpha: 1)
            if (self.event.userInfo) != nil {
                //c = UIColor()
            }

            if(active) {
                self.backgroundColor = c.withAlphaComponent(0.8)
                self.layer.borderColor = c.cgColor
                self.layer.borderWidth = 1
            }
            else {
                self.backgroundColor = c.withAlphaComponent(0.5)
                self.layer.borderColor = nil
                self.layer.borderWidth = 0
            }
        }
    }
}
