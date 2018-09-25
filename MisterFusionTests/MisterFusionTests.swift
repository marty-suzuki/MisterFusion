//
//  MisterFusionTests.swift
//  MisterFusionTests
//
//  Created by 鈴木大貴 on 2017/08/15.
//  Copyright © 2017年 marty-suzuki. All rights reserved.
//

#if os(iOS)
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
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
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
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
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

        XCTAssertEqual(firstConstraint.firstAttribute, .right)
        XCTAssertEqual(firstConstraint.firstAttribute, secondConstraint.firstAttribute)

        XCTAssertEqual(firstConstraint.relation, .equal)
        XCTAssertEqual(firstConstraint.relation, secondConstraint.relation)

        XCTAssertEqual(firstConstraint.secondItem as? UIView, superview)
        XCTAssertEqual(firstConstraint.secondItem as? UIView, secondConstraint.secondItem as? UIView)

        XCTAssertEqual(firstConstraint.secondAttribute, .right)
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
        XCTAssertEqual(constraint.firstAttribute, .width)
        XCTAssertNotEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute, .notAnAttribute)
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
        XCTAssertEqual(constraint.firstAttribute, .height)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem as? UIView, nil)
        XCTAssertEqual(constraint.secondAttribute,.notAnAttribute)
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
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .lessThanOrEqual)
        XCTAssertEqual(constraint.secondItem as? UIView, superview)
        XCTAssertEqual(constraint.secondAttribute, .top)
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
        XCTAssertEqual(constraint.firstAttribute, .bottom)
        XCTAssertEqual(constraint.relation, .greaterThanOrEqual)
        XCTAssertEqual(constraint.secondItem as? UIView, superview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.constant, 90)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }

    func testSafeAreaTopRelatedEqualConstant() {
        let superview = UIView()
        let subview = UIView()
        guard let constraint = superview.mf.addSubview(subview, andConstraint:
            superview.safeArea.top |==| subview.top
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        if #available(iOS 11, *) {
            XCTAssertEqual(constraint.firstItem as? UILayoutGuide, superview.safeAreaLayoutGuide)
        } else {
            XCTAssertEqual(constraint.firstItem as? UIView, superview)
        }
        XCTAssertEqual(constraint.firstAttribute, .top)
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem as? UIView, subview)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }

    func testViewControllerSafeAreaTopRelatedEqualConstant() {
        let viewController = UIViewController()
        let subview = UIView()
        guard let constraint = viewController.view.mf.addSubview(subview, andConstraint:
            viewController.safeArea.top |==| subview.top
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        if #available(iOS 11, *) {
            XCTAssertEqual(constraint.firstItem as? UILayoutGuide, viewController.view.safeAreaLayoutGuide)
            XCTAssertEqual(constraint.firstAttribute, .top)
        } else {
            XCTAssertEqual((constraint.firstItem as? UILayoutSupport)?.bottomAnchor, viewController.topLayoutGuide.bottomAnchor)
            XCTAssertEqual(constraint.firstAttribute, .bottom)
        }
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem as? UIView, subview)
        XCTAssertEqual(constraint.secondAttribute, .top)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }

    func testViewControllerSafeAreaBottomRelatedEqualConstant() {
        let viewController = UIViewController()
        let subview = UIView()
        guard let constraint = viewController.view.mf.addSubview(subview, andConstraint:
            viewController.safeArea.bottom |==| subview.bottom
            ) else {
                XCTFail("must return NSLayoutConstraint")
                return
        }

        if #available(iOS 11, *) {
            XCTAssertEqual(constraint.firstItem as? UILayoutGuide, viewController.view.safeAreaLayoutGuide)
            XCTAssertEqual(constraint.firstAttribute, .bottom)
        } else {
            XCTAssertEqual((constraint.firstItem as? UILayoutSupport)?.topAnchor, viewController.bottomLayoutGuide.topAnchor)
            XCTAssertEqual(constraint.firstAttribute, .top)
        }
        XCTAssertEqual(constraint.relation, .equal)
        XCTAssertEqual(constraint.secondItem as? UIView, subview)
        XCTAssertEqual(constraint.secondAttribute, .bottom)
        XCTAssertEqual(constraint.constant, 0)
        XCTAssertEqual(constraint.multiplier, 1)
        XCTAssertEqual(constraint.priority, UILayoutPriority.required)
    }
}
#endif
