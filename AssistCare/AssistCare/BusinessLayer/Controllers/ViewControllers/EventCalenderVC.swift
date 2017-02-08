//
//  EventCalenderVC.swift
//  AssistCare
//
//  Created by developer91 on 2/8/17.
//  Copyright © 2017 Lanetteam. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class EventCalenderVC: UIViewController, DDCalendarViewDelegate, DDCalendarViewDataSource, EKEventViewDelegate{

    @IBOutlet var lbDay: UILabel!
    @IBOutlet var calenderView: DDCalendarView!

    
    var dict = Dictionary<Int, [DDCalendarEvent]>()
    var mgr = EventManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calenderView.scrollDateToVisible(Date(), animated: false)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func eventsForDay(dayMod: Int) -> [AnyObject] {
        var event2 = DDCalendarEvent()
        event2.title = "Demo Event 3"
        event2.dateBegin = NSDate(hour: 3, min: 15, inDays: dayMod) as Date!
        event2.dateEnd = NSDate(hour: 4, min: 0, inDays: dayMod) as Date!
        event2.userInfo = ["color": UIColor.yellow]
        var event3 = DDCalendarEvent()
        event3.title = "Demo Event 1"
        event3.dateBegin = NSDate(hour: 1, min: 00, inDays: dayMod) as Date!
        event3.dateEnd = NSDate(hour: 2, min: 10, inDays: dayMod) as Date!
        var event4 = DDCalendarEvent()
        event4.title = "Demo Event 5"
        event4.dateBegin = NSDate(hour: 5, min: 39, inDays: dayMod) as Date!
        event4.dateEnd = NSDate(hour: 6, min: 13, inDays: dayMod) as Date!
        event4.userInfo = ["color": UIColor.yellow]
        var event1 = DDCalendarEvent()
        event1.title = "Demo Event 7"
        event1.dateBegin = NSDate(hour: 7, min: 00, inDays: dayMod) as Date!
        event1.dateEnd = NSDate(hour: 10, min: 13, inDays: dayMod) as Date!
        var event5 = DDCalendarEvent()
        event5.title = "Demo Event 13"
        event5.dateBegin = NSDate(hour: 12, min: 00, inDays: dayMod) as Date!
        event5.dateEnd = NSDate(hour: 14, min: 13, inDays: dayMod) as Date!
        var event7 = DDCalendarEvent()
        event7.title = "Demo Event 15"
        event7.dateBegin = NSDate(hour: 17, min: 30, inDays: dayMod) as Date!
        event7.dateEnd = NSDate(hour: 17, min: 45, inDays: dayMod) as Date!
        event7.userInfo = ["color": UIColor.green]
        var event8 = DDCalendarEvent()
        event8.title = "Demo Event 17"
        event8.dateBegin = NSDate(hour: 18, min: 40, inDays: dayMod) as Date!
        event8.dateEnd = NSDate(hour: 21, min: 30, inDays: dayMod) as Date!
        var event9 = DDCalendarEvent()
        event9.title = "Demo Event 22"
        event9.dateBegin = NSDate(hour: 22, min: 00, inDays: dayMod) as Date!
        event9.dateEnd = NSDate(hour: 23, min: 30, inDays: dayMod) as Date!
        if dayMod % 2 != 0 {
            return [event1, event2, event3, event4, event5, event7, event8, event9]
        }
        else {
            return [event2, event4, event8]
        }
    }
    
    
    func calendarView(_ view: DDCalendarView, focussedOnDay date: Date) {
        //self.lbDay.text = (date as NSDate).stringWithDateOnly()
        
        
        let days = (date as NSDate).days(from: Date())
        self.loadCachedEvents(days) { (events) -> Void in
            self.loadCachedEvents(days-1) { (events) -> Void in
                self.loadCachedEvents(days+1) { (events) -> Void in
                    self.calenderView.reloadData()
                }
            }
        }
        
    }
    
    func calendarView(_ view: DDCalendarView, didSelect event: DDCalendarEvent) {
        let ekEvent = event.userInfo["event"] as! EKEvent
        
        let vc = EKEventViewController()
        vc.delegate = self;
        vc.event = ekEvent
        let nav = UINavigationController(rootViewController: vc)
        
        self.present(nav, animated: true, completion: nil)
    }
    
    func calendarView(_ view: DDCalendarView, allowEditing event: DDCalendarEvent) -> Bool {
        //NOTE some check could be here, we just say true :D
        let ekEvent = event.userInfo["event"] as! EKEvent
        let ekCal = ekEvent.calendarItemIdentifier
        print(ekCal)
        
        return true
    }
    
    func calendarView(_ view: DDCalendarView, commitEdit event: DDCalendarEvent) {
        //NOTE we dont actually save anything because this demo doesnt wanna mess with your calendar :)
    }
    
    // MARK: dataSource
    
    public func calendarView(_ view: DDCalendarView, eventsForDay date: Date) -> [Any]? {
        let daysModifier = (date as NSDate).days(from: Date())
        var newE:[DDCalendarEvent] = self.eventsForDay(dayMod: daysModifier) as! [DDCalendarEvent]
        var dates:[Any] = [Any]()
        
        for  e:DDCalendarEvent in newE {
            if (e.dateBegin.daysBetweenDate(toDate: date) == 0 || e.dateEnd.daysBetweenDate(toDate: date) == 0)
             {
                dates.append(e)
            }
        }
        
        return dates
    }
    
    public func calendarView(_ view: DDCalendarView, viewFor event: DDCalendarEvent) -> DDCalendarEventView? {
        return EventView(event: event)
    }
    
    // MARK: helper
    
    func loadCachedEvents(_ day:Int, handler:@escaping ([DDCalendarEvent])->Void) {
        let events = dict[day]
        if(events == nil) {
            mgr.getEvents(day, calendars: nil, handler: { (newEvents) -> Void in
                //make DDEvents
                var ddEvents = [DDCalendarEvent]()
                for ekEvent in newEvents {
                    if ekEvent.isAllDay == false {
                        let ddEvent = DDCalendarEvent()
                        ddEvent.title = ekEvent.title
                        ddEvent.dateBegin = ekEvent.startDate
                        ddEvent.dateEnd = ekEvent.endDate
                        ddEvent.userInfo = ["event":ekEvent]
                        ddEvents.append(ddEvent)
                    }
                }
                self.dict[day] = ddEvents
                handler(ddEvents)
            })
        }
        else {
            handler(events!)
        }
    }
    
    // MARK: delegate
    
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension Date {
    func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
}
