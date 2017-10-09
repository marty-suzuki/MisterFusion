//
//  MisterFusionTests.swift
//  MisterFusionTests
//
//  Created by 鈴木大貴 on 2017/08/15.
//  Copyright © 2017年 marty-suzuki. All rights reserved.
//

import XCTest
@testable import MisterFusion

class MisterFusionTests: XCTestCase {
    func testNotRelatedGreaterThanOrEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            subview.height |>=| 90
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .some(.height))
        XCTAssertEqual(constraint.relation, .some(.greaterThanOrEqual))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .some(.notAnAttribute))
        XCTAssertEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }

    func testNotRelatedLessThanOrEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            subview.width |<=| 65
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .some(.width))
        XCTAssertEqual(constraint.relation, .some(.lessThanOrEqual))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .some(.notAnAttribute))
        XCTAssertEqual(constraint.constant, 65)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }

    func testCombination() {
        let superview = UIView()
        let subview = UIView()
        let constraints = superview.mf.addSubview(subview, andConstraints:
            subview.right |+| 0.5,
            subview.right |==| superview.right |*| 1 |+| 0.5 |<>| UILayoutPriority.required
        )

        guard let firstConstraint = constraints.first, let secondConstraint = constraints.last else {
            XCTFail("must return NSLayoutConstraint")
            return
        }

        XCTAssertEqual(firstConstraint.firstItem as? UIView, subview)
        XCTAssertEqual(firstConstraint.firstItem as? UIView, secondConstraint.firstItem as? UIView)

        XCTAssertEqual(firstConstraint.firstAttribute, .some(.right))
        XCTAssertEqual(firstConstraint.firstAttribute, secondConstraint.firstAttribute)

        XCTAssertEqual(firstConstraint.relation, .some(.equal))
        XCTAssertEqual(firstConstraint.relation, secondConstraint.relation)

        XCTAssertEqual(firstConstraint.secondItem as? UIView, superview)
        XCTAssertEqual(firstConstraint.secondItem as? UIView, secondConstraint.secondItem as? UIView)

        XCTAssertEqual(firstConstraint.secondAttribute, .some(.right))
        XCTAssertEqual(firstConstraint.secondAttribute, secondConstraint.secondAttribute)

        XCTAssertEqual(firstConstraint.constant, 0.5)
        XCTAssertEqual(firstConstraint.constant, secondConstraint.constant)

        XCTAssertEqual(firstConstraint.multiplier, 1)
        XCTAssertEqual(firstConstraint.multiplier, secondConstraint.multiplier)

        XCTAssertEqual(firstConstraint.priority, UILayoutPriority.required)
        XCTAssertEqual(firstConstraint.priority, secondConstraint.priority)
    }

    func testNotRelatedEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        let isTrue = subview.superview == superview
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            isTrue ? subview.height |==| 90 : subview.width |==| 100
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .some(.width))
        XCTAssertNotEqual(constraint.firstAttribute, .some(.height))
        XCTAssertEqual(constraint.relation, .some(.equal))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .some(.notAnAttribute))
        XCTAssertEqual(constraint.constant, 100)
        XCTAssertNotEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }

    func testIdentifier() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            subview.height |==| 90 -=- "TestSubViewHeight"
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .some(.height))
        XCTAssertEqual(constraint.relation, .some(.equal))
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .some(.notAnAttribute))
        XCTAssertEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
        XCTAssertEqual(constraint.identifier, "TestSubViewHeight")
    }

    func testTopRelatedLessThanOrEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            subview.top |<=| 65
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .some(.top))
        XCTAssertEqual(constraint.relation, .some(.lessThanOrEqual))
        XCTAssertEqual(constraint.secondItem as? UIView, superview)
        XCTAssertEqual(constraint.secondAttribute, .some(.top))
        XCTAssertEqual(constraint.constant, 65)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }

    func testBottomRelatedGreaterThanOrEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            subview.bottom |>=| 90
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        XCTAssertEqual(constraint.firstItem as? UIView, subview)
        XCTAssertEqual(constraint.firstAttribute, .some(.bottom))
        XCTAssertEqual(constraint.relation, .some(.greaterThanOrEqual))
        XCTAssertEqual(constraint.secondItem as? UIView, superview)
        XCTAssertEqual(constraint.secondAttribute, .some(.bottom))
        XCTAssertEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }
    
    @available(iOS 11, *)
    func testSafeAreaTopRelatedEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            superview.safeArea.top |==| subview.top
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }
        
        XCTAssertEqual(constraint.firstItem as? UILayoutGuide, superview.safeAreaLayoutGuide)
        XCTAssertEqual(constraint.firstAttribute, .some(.top))
        XCTAssertEqual(constraint.relation, .some(.equal))
        XCTAssertEqual(constraint.secondItem as? UIView, subview)
        XCTAssertEqual(constraint.secondAttribute, .some(.top))
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }
}
