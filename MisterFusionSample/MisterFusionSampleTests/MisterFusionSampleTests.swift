//
//  MisterFusionSampleTests.swift
//  MisterFusionSampleTests
//
//  Created by 鈴木大貴 on 2016/03/08.
//  Copyright © 2016年 Taiki Suzuki. All rights reserved.
//

import XCTest
import MisterFusion

class MisterFusionSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNotRelatedGreaterThanOrEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.addLayoutSubview(subview, andConstraint:
            subview.Height |>=| 90
        ) else {
            XCTFail("must return NSLayoutConstraint")
            return
        }
        
        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .Some(.Height))
        XCTAssertEqual(constraint.relation, .Some(.GreaterThanOrEqual))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .Some(.NotAnAttribute))
        XCTAssertEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriorityRequired)
    }
    
    func testNotRelatedLessThanOrEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.addLayoutSubview(subview, andConstraint:
            subview.Height |<=| 65
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }
        
        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .Some(.Height))
        XCTAssertEqual(constraint.relation, .Some(.LessThanOrEqual))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .Some(.NotAnAttribute))
        XCTAssertEqual(constraint.constant, 65)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriorityRequired)
    }

    func testCombination() {
        let superview = UIView()
        let subview = UIView()
        let constraints = superview.addLayoutSubview(subview, andConstraints:
            subview.Right |+| 0.5,
            subview.Right |==| superview.Right |*| 1 |+| 0.5 |<>| UILayoutPriorityRequired
        )
        
        guard let firstConstraint = constraints.first, secondConstraint = constraints.last else {
            XCTFail("must return NSLayoutConstraint")
            return
        }
        
        XCTAssertEqual(firstConstraint.firstItem as? UIView, subview)
        XCTAssertEqual(firstConstraint.firstItem as? UIView, secondConstraint.firstItem as? UIView)
        
        XCTAssertEqual(firstConstraint.firstAttribute, .Some(.Right))
        XCTAssertEqual(firstConstraint.firstAttribute, secondConstraint.firstAttribute)
        
        XCTAssertEqual(firstConstraint.relation, .Some(.Equal))
        XCTAssertEqual(firstConstraint.relation, secondConstraint.relation)
        
        XCTAssertEqual(firstConstraint.secondItem as? UIView, superview)
        XCTAssertEqual(firstConstraint.secondItem as? UIView, secondConstraint.secondItem as? UIView)
        
        XCTAssertEqual(firstConstraint.secondAttribute, .Some(.Right))
        XCTAssertEqual(firstConstraint.secondAttribute, secondConstraint.secondAttribute)
        
        XCTAssertEqual(firstConstraint.constant, 0.5)
        XCTAssertEqual(firstConstraint.constant, secondConstraint.constant)
        
        XCTAssertEqual(firstConstraint.multiplier, 1)
        XCTAssertEqual(firstConstraint.multiplier, secondConstraint.multiplier)
        
        XCTAssertEqual(firstConstraint.priority, UILayoutPriorityRequired)
        XCTAssertEqual(firstConstraint.priority, secondConstraint.priority)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNotRelatedEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        let isTrue = subview.superview == superview
        guard let constraint = superview.addLayoutSubview(subview, andConstraint:
            isTrue ? subview.Height |==| 90 : subview.Width |==| 100
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }
        
        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .Some(.Width))
        XCTAssertNotEqual(constraint.firstAttribute, .Some(.Height))
        XCTAssertEqual(constraint.relation, .Some(.Equal))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .Some(.NotAnAttribute))
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertNotEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriorityRequired)
    }
    
    func testIdentifier() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.addLayoutSubview(subview, andConstraint:
            subview.Height |==| 90 -=- "TestSubViewHeight"
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }
        
        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .Some(.Height))
        XCTAssertEqual(constraint.relation, .Some(.Equal))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .Some(.NotAnAttribute))
        XCTAssertEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriorityRequired)
        XCTAssertEqual(constraint.identifier, "TestSubViewHeight")
    }
}
