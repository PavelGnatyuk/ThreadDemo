//
//  ViewController.swift
//  ThreadDemo
//
//  Created by Pavel Gnatyuk on 01/07/2017.
//  Copyright © 2017 Pavel Gnatyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var thread: Thread?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let button1 = UIButton(type: .plain)
        button1.setTitle("Start Thread", for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(startThread), for: .touchUpInside)
        
        let button2 = UIButton(type: .plain)
        button2.setTitle("Cancel Thread", for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(cancelThread), for: .touchUpInside)
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: self.view,
                                              attribute: .top, multiplier: 1.0, constant: 60.0))
        constraints.append(NSLayoutConstraint(item: button1, attribute: .left, relatedBy: .equal, toItem: self.view,
                                              attribute: .left, multiplier: 1.0, constant: 20.0))
        constraints.append(NSLayoutConstraint(item: button1, attribute: .right, relatedBy: .equal, toItem: self.view,
                                              attribute: .right, multiplier: 1.0, constant: -20.0))
        constraints.append(NSLayoutConstraint(item: button1, attribute: .height, relatedBy: .equal, toItem: self.view,
                                              attribute: .height, multiplier: 0.0, constant: 30.0))
        
        constraints.append(NSLayoutConstraint(item: button2, attribute: .top, relatedBy: .equal, toItem: button1,
                                              attribute: .bottom, multiplier: 1.0, constant: 20.0))
        constraints.append(NSLayoutConstraint(item: button2, attribute: .left, relatedBy: .equal, toItem: button1,
                                              attribute: .left, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint(item: button2, attribute: .right, relatedBy: .equal, toItem: button1,
                                              attribute: .right, multiplier: 1.0, constant: 0.0))
        constraints.append(NSLayoutConstraint(item: button2, attribute: .height, relatedBy: .equal, toItem: button1,
                                              attribute: .height, multiplier: 1.0, constant: 0.0))
        
        NSLayoutConstraint.activate(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc
    func startThread() {
        guard thread == nil else {
            return
        }
        
        thread = Thread(block: {
            
            var counter = 0
            while counter < 60 {
                print("Counter is \(counter)")
                sleep(1)
                counter += 1
                
                let current = Thread.current
                if current.isCancelled {
                    print("Canceled")
                    break
                }
            }
            print("finished")
        })
        thread?.start()
    }
    
    @objc
    func cancelThread() {
        guard thread != nil else {
            return
        }
        
        if let t = thread, t.isExecuting {
            t.cancel()
        }
        thread = nil
    }
    
}

