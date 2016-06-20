
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
    
    private var whiteView: UIView?
    private var redView: UIView?
    private var whiteViewWidthConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let redView = UIView()
        redView.backgroundColor = .red()
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        //Ordinary AutoLayout code
        view.addConstraints([
            NSLayoutConstraint(item: redView, attribute: .top,    relatedBy: .equal, toItem: view, attribute: .top,    multiplier: 1,   constant: 10),
            NSLayoutConstraint(item: redView, attribute: .right,  relatedBy: .equal, toItem: view, attribute: .right,  multiplier: 1,   constant: -10),
            NSLayoutConstraint(item: redView, attribute: .left,   relatedBy: .equal, toItem: view, attribute: .left,   multiplier: 1,   constant: 10),
            NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: -15),
        ])
        self.redView = redView
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow()
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yellowView)
        //MisterFusion code
        let _ = view.addLayoutConstraints(
            yellowView.top    |==| redView.bottom |+| 10,
            yellowView.right  |==| view.right     |-| 10,
            yellowView.left   |==| view.left      |+| 10,
            yellowView.height |==| view.height    |/| 2 |-| 15
        )
        
        let greenView = UIView()
        greenView.backgroundColor = .green()
        //Advanced MisterFusion code
        greenViewBottomConstraint = yellowView.addLayoutSubview(greenView, andConstraints:
            greenView.top,
            greenView.right,
            greenView.bottom,
            greenView.width |*| 0.5
        ).firstAttribute(.bottom).first
        self.greenView = greenView
        
        let whiteView = UIView()
        whiteView.backgroundColor = .white()
        let _ = redView.addLayoutSubview(whiteView, andConstraints:
            whiteView.bottom |-| 10,
            whiteView.left |+| 10,
            whiteView.height |==| 100
        )
        self.whiteView = whiteView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reduceAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard let whiteView = whiteView, redView = redView else { return }
        if let whiteViewHeightConstraint = whiteViewWidthConstraint {
            redView.removeConstraint(whiteViewHeightConstraint)
        }
        self.whiteViewWidthConstraint = redView.addLayoutConstraints(
            whiteView.width |-| 20 <|> .compact <-> .regular,
            whiteView.width |*| 0.5 |-| 10 <|> .regular <-> .compact
        ).firstAttribute(.width).first
    }
    
    func stretchAnmation() {
        greenViewBottomConstraint?.constant = 0
        UIView.animate(withDuration: 2, animations: {
            self.greenView?.superview?.layoutIfNeeded()
        }) { _ in
            self.reduceAnimation()
        }
    }
    
    func reduceAnimation() {
        let constant = self.greenView?.superview?.frame.size.height ?? 0
        greenViewBottomConstraint?.constant = -constant / 2
        UIView.animate(withDuration: 2, animations: {
            self.greenView?.superview?.layoutIfNeeded()
        }) { _ in
            self.stretchAnmation()
        }
    }
}

