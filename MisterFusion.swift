//
//  MisterFusion.swift
//  MisterFusion
//
//  Created by Taiki Suzuki on 2015/11/13.
//  Copyright © 2015年 szk-atmosphere All rights reserved.
//

import UIKit

infix operator |==| { associativity left precedence 100 }
func |==| (left: MisterFusion, right: MisterFusion) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .Equal, toItem: right.item, toAttribute: right.attribute, multiplier: nil, constant: nil)
}

infix operator |<=| { associativity left precedence 100 }
func |<=| (left: MisterFusion, right: MisterFusion) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .LessThanOrEqual, toItem: right.item, toAttribute: right.attribute, multiplier: nil, constant: nil)
}

infix operator |>=| { associativity left precedence 100 }
func |>=| (left: MisterFusion, right: MisterFusion) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .GreaterThanOrEqual, toItem: right.item, toAttribute: right.attribute, multiplier: nil, constant: nil)
}

infix operator |+| { associativity left precedence 100 }
func |+| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: right)
}

infix operator |-| { associativity left precedence 100 }
func |-| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: -right)
}

infix operator |*| { associativity left precedence 100 }
func |*| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: right, constant: left.constant)
}

infix operator |/| { associativity left precedence 100 }
func |/| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: 1 / right, constant: left.constant)
}

struct MisterFusion {
    private let item: UIView?
    private let attribute: NSLayoutAttribute?
    private let relatedBy: NSLayoutRelation?
    private let toItem: UIView?
    private let toAttribute: NSLayoutAttribute?
    private let multiplier: CGFloat?
    private let constant: CGFloat?
}

extension UIView {
    var Top: MisterFusion { return createMisterFusion(.Top) }
    
    var Right: MisterFusion { return createMisterFusion(.Right) }
    
    var Left: MisterFusion { return createMisterFusion(.Left) }
    
    var Bottom: MisterFusion { return createMisterFusion(.Bottom) }
    
    var Height: MisterFusion { return createMisterFusion(.Height) }
    
    var Width: MisterFusion { return createMisterFusion(.Width) }
    
    var Leading: MisterFusion { return createMisterFusion(.Leading) }
    
    var Trailing: MisterFusion { return createMisterFusion(.Trailing) }
    
    var CenterX: MisterFusion { return createMisterFusion(.CenterX) }
    
    var CenterY: MisterFusion { return createMisterFusion(.CenterY) }
    
    var Baseline: MisterFusion { return createMisterFusion(.Baseline) }
    
    var LastBaseline: MisterFusion { return createMisterFusion(.LastBaseline) }
    
    var NotAnAttribute: MisterFusion { return createMisterFusion(.NotAnAttribute) }
    
    @available(iOS 8.0, *)
    var LeftMargin: MisterFusion { return createMisterFusion(.LeftMargin) }
    
    @available(iOS 8.0, *)
    var RightMargin: MisterFusion { return createMisterFusion(.RightMargin) }
    
    @available(iOS 8.0, *)
    var TopMargin: MisterFusion { return createMisterFusion(.TopMargin) }
    
    @available(iOS 8.0, *)
    var BottomMargin: MisterFusion { return createMisterFusion(.BottomMargin) }
    
    @available(iOS 8.0, *)
    var LeadingMargin: MisterFusion { return createMisterFusion(.LeadingMargin) }
    
    @available(iOS 8.0, *)
    var TrailingMargin: MisterFusion { return createMisterFusion(.TrailingMargin) }
    
    @available(iOS 8.0, *)
    var CenterXWithinMargins: MisterFusion { return createMisterFusion(.CenterXWithinMargins) }
    
    @available(iOS 8.0, *)
    var CenterYWithinMargins: MisterFusion { return createMisterFusion(.CenterYWithinMargins) }
    
    private func createMisterFusion(attribute: NSLayoutAttribute) -> MisterFusion {
        return MisterFusion(item: self, attribute: attribute, relatedBy: nil, toItem: nil, toAttribute: nil, multiplier: nil, constant: nil)
    }
    
    func addConstraint(misterFusion: MisterFusion) -> NSLayoutConstraint {
        let item: UIView = misterFusion.item ?? self
        let attribute: NSLayoutAttribute = misterFusion.attribute ?? .NotAnAttribute
        let relatedBy: NSLayoutRelation = misterFusion.relatedBy ?? .Equal
        let toItem: UIView = misterFusion.toItem ?? self
        let toAttribute: NSLayoutAttribute = misterFusion.toAttribute ?? attribute
        let multiplier: CGFloat = misterFusion.multiplier ?? 1
        let constant: CGFloat = misterFusion.constant ?? 0
        let constraint = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relatedBy, toItem: toItem, attribute: toAttribute, multiplier: multiplier, constant: constant)
        addConstraint(constraint)
        return constraint
    }
    
    func addConstraints(misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return misterFusions.map { addConstraint($0) }
    }
}