//
//  ViewController.swift
//  MisterFusionSample
//
//  Created by 鈴木大貴 on 2015/11/13.
//  Copyright © 2015年 Taiki Suzuki. All rights reserved.
//

import UIKit
import MisterFusion

class ViewController: UIViewController {
    private var greenView: UIView?
    private var greenViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let redView = UIView()
        redView.backgroundColor = .redColor()
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        //Ordinary AutoLayout code
        view.addConstraints([
            NSLayoutConstraint(item: redView, attribute: .Top,    relatedBy: .Equal, toItem: view, attribute: .Top,    multiplier: 1,   constant: 10),
            NSLayoutConstraint(item: redView, attribute: .Right,  relatedBy: .Equal, toItem: view, attribute: .Right,  multiplier: 1,   constant: -10),
            NSLayoutConstraint(item: redView, attribute: .Left,   relatedBy: .Equal, toItem: view, attribute: .Left,   multiplier: 1,   constant: 10),
            NSLayoutConstraint(item: redView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.5, constant: -15),
        ])
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellowColor()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yellowView)
        //MisterFusion code
        view.addLayoutConstraints(
            yellowView.Top    |==| redView.Bottom |+| 10,
            yellowView.Right  |==| view.Right     |-| 10,
            yellowView.Left   |==| view.Left      |+| 10,
            yellowView.Height |==| view.Height    |/| 2 |-| 15
        )
        
        let greenView = UIView()
        greenView.backgroundColor = .greenColor()
        //Advanced MisterFusion code
        greenViewBottomConstraint = yellowView.addLayoutSubview(greenView, andConstraints:
            greenView.Top,
            greenView.Right,
            greenView.Bottom,
            greenView.Width |*| 0.5
        ).filter { $0.firstAttribute == .Bottom }.first
        self.greenView = greenView
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        reduceAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func stretchAnmation() {
        greenViewBottomConstraint?.constant = 0
        UIView.animateWithDuration(2, animations: {
            self.greenView?.superview?.layoutIfNeeded()
        }) { _ in
            self.reduceAnimation()
        }
    }
    
    func reduceAnimation() {
        let constant = self.greenView?.superview?.frame.size.height ?? 0
        greenViewBottomConstraint?.constant = -constant / 2
        UIView.animateWithDuration(2, animations: {
            self.greenView?.superview?.layoutIfNeeded()
        }) { _ in
            self.stretchAnmation()
        }
    }
}

