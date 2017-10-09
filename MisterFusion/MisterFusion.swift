//
//  MisterFusion.swift
//  MisterFusion
//
//  Created by Taiki Suzuki on 2015/11/13.
//  Copyright © 2015年 Taiki Suzuki. All rights reserved.
//

import UIKit

protocol LayoutObject: class {}

extension UIView: LayoutObject {}

@available(iOS 9.0, *)
extension UILayoutGuide: LayoutObject {}

public class MisterFusion: NSObject {
    fileprivate let item: LayoutObject?
    fileprivate let attribute: NSLayoutAttribute?
    fileprivate let relatedBy: NSLayoutRelation?
    fileprivate let toItem: LayoutObject?
    fileprivate let toAttribute: NSLayoutAttribute?
    fileprivate let multiplier: CGFloat?
    fileprivate let constant: CGFloat?
    fileprivate let priority: UILayoutPriority?
    fileprivate let horizontalSizeClass: UIUserInterfaceSizeClass?
    fileprivate let verticalSizeClass: UIUserInterfaceSizeClass?
    fileprivate let identifier: String?
    
    override open var description: String {
        return "\(super.description)\n" +
               "item               : \(item as LayoutObject?)\n" +
               "attribute          : \(attribute as NSLayoutAttribute?))\n" +
               "relatedBy          : \(relatedBy as NSLayoutRelation?))\n" +
               "toItem             : \(toItem as LayoutObject?)\n" +
               "toAttribute        : \(toAttribute as NSLayoutAttribute?))\n" +
               "multiplier         : \(multiplier as CGFloat?)\n" +
               "constant           : \(constant as CGFloat?)\n" +
               "priority           : \(priority as UILayoutPriority?)\n" +
               "horizontalSizeClass: \(horizontalSizeClass as UIUserInterfaceSizeClass?)\n" +
               "verticalSizeClass  : \(verticalSizeClass as UIUserInterfaceSizeClass?)\n"
    }
    
    init(item: LayoutObject?, attribute: NSLayoutAttribute?, relatedBy: NSLayoutRelation?, toItem: LayoutObject?, toAttribute: NSLayoutAttribute?, multiplier: CGFloat?, constant: CGFloat?, priority: UILayoutPriority?, horizontalSizeClass: UIUserInterfaceSizeClass?, verticalSizeClass: UIUserInterfaceSizeClass?, identifier: String?) {
        self.item = item
        self.attribute = attribute
        self.relatedBy = relatedBy
        self.toItem = toItem
        self.toAttribute = toAttribute
        self.multiplier = multiplier
        self.constant = constant
        self.priority = priority
        self.horizontalSizeClass = horizontalSizeClass
        self.verticalSizeClass = verticalSizeClass
        self.identifier = identifier
        super.init()
    }
    
    @available(*, unavailable)
    open var Equal: (MisterFusion) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |==| $0
        }
    }
    
    @available(*, unavailable)
    open var NotRelatedEqualConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |==| $0
        }
    }
    
    @available(*, unavailable)
    open var LessThanOrEqual: (MisterFusion) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |<=| $0
        }
    }
    
    @available(*, unavailable)
    open var NotRelatedLessThanOrEqualConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |<=| $0
        }
    }
    
    @available(*, unavailable)
    open var GreaterThanOrEqual: (MisterFusion) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |>=| $0
        }
    }
    
    @available(*, unavailable)
    open var NotRelatedGreaterThanOrEqualConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |>=| $0
        }
    }
    
    @available(*, unavailable)
    open var Multiplier: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |*| $0
        }
    }
    
    @available(*, unavailable)
    open var Constant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |+| $0
        }
    }
    
    @available(*, unavailable)
    open var Priority: (UILayoutPriority) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |<>| $0
        }
    }
    
    @available(*, unavailable)
    open var NotRelatedConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |==| $0
        }
    }
    
    @available(*, unavailable)
    open var HorizontalSizeClass: (UIUserInterfaceSizeClass) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me <-> $0
        }
    }

    @available(*, unavailable)
    open var VerticalSizeClass: (UIUserInterfaceSizeClass) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me <|> $0
        }
    }
    
    @available(*, unavailable)
    open var Identifier: (String) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me -=- $0
        }
    }
}

precedencegroup MisterFusionAdditive {
    associativity: left
    higherThan: TernaryPrecedence, CastingPrecedence, AssignmentPrecedence
}

infix operator |==| : MisterFusionAdditive
public func |==| (left: MisterFusion, right: MisterFusion) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .equal, toItem: right.item, toAttribute: right.attribute, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: left.identifier)
}

public func |==| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .equal, toItem: nil, toAttribute: .notAnAttribute, multiplier: nil, constant: right, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: left.identifier)
}

infix operator |<=| : MisterFusionAdditive
public func |<=| (left: MisterFusion, right: MisterFusion) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .lessThanOrEqual, toItem: right.item, toAttribute: right.attribute, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: left.identifier)
}

public func |<=| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    let toAttribute = left.attribute == .height || left.attribute == .width ? .notAnAttribute : left.attribute
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .lessThanOrEqual, toItem: nil, toAttribute: toAttribute, multiplier: nil, constant: right, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: left.identifier)
}

infix operator |>=| : MisterFusionAdditive
public func |>=| (left: MisterFusion, right: MisterFusion) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .greaterThanOrEqual, toItem: right.item, toAttribute: right.attribute, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: left.identifier)
}

public func |>=| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    let toAttribute = left.attribute == .height || left.attribute == .width ? .notAnAttribute : left.attribute
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: .greaterThanOrEqual, toItem: nil, toAttribute: toAttribute, multiplier: nil, constant: right, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: left.identifier)
}

infix operator |+| : MisterFusionAdditive
public func |+| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: right, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator |-| : MisterFusionAdditive
public func |-| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: -right, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator |*| : MisterFusionAdditive
public func |*| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: right, constant: left.constant, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator |/| : MisterFusionAdditive
public func |/| (left: MisterFusion, right: CGFloat) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: 1 / right, constant: left.constant, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator |<>| : MisterFusionAdditive
public func |<>| (left: MisterFusion, right: UILayoutPriority) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: right, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator <-> : MisterFusionAdditive
public func <-> (left: MisterFusion, right: UIUserInterfaceSizeClass) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: left.priority, horizontalSizeClass: right, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator <|> : MisterFusionAdditive
public func <|> (left: MisterFusion, right: UIUserInterfaceSizeClass) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: right, identifier: left.identifier)
}

infix operator -=- : MisterFusionAdditive
public func -=- (left: MisterFusion, right: String) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: right)
}

extension UIView {
    @objc(Top)
    public var top: MisterFusion { return createMisterFusion(with: .top) }
    
    @objc(Right)
    public var right: MisterFusion { return createMisterFusion(with: .right) }
    
    @objc(Left)
    public var left: MisterFusion { return createMisterFusion(with: .left) }
    
    @objc(Bottom)
    public var bottom: MisterFusion { return createMisterFusion(with: .bottom) }
    
    @objc(Height)
    public var height: MisterFusion { return createMisterFusion(with: .height) }
    
    @objc(Width)
    public var width: MisterFusion { return createMisterFusion(with: .width) }
    
    @objc(Leading)
    public var leading: MisterFusion { return createMisterFusion(with: .leading) }
    
    @objc(Trailing)
    public var trailing: MisterFusion { return createMisterFusion(with: .trailing) }
    
    @objc(CenterX)
    public var centerX: MisterFusion { return createMisterFusion(with: .centerX) }
    
    @objc(CenterY)
    public var centerY: MisterFusion { return createMisterFusion(with: .centerY) }

    @available(iOS, obsoleted: 7.0, renamed: "lastBaseline")
    @objc(Baseline)
    public var baseline: MisterFusion { return createMisterFusion(with: .lastBaseline) }
    
    @objc(NotAnAttribute)
    public var notAnAttribute: MisterFusion { return createMisterFusion(with: .notAnAttribute) }
    
    @objc(LastBaseline)
    public var lastBaseline: MisterFusion { return createMisterFusion(with: .lastBaseline) }
    
    @available(iOS 8.0, *)
    @objc(FirstBaseline)
    public var firstBaseline: MisterFusion { return createMisterFusion(with: .firstBaseline) }
    
    @available(iOS 8.0, *)
    @objc(LeftMargin)
    public var leftMargin: MisterFusion { return createMisterFusion(with: .leftMargin) }
    
    @available(iOS 8.0, *)
    @objc(RightMargin)
    public var rightMargin: MisterFusion { return createMisterFusion(with: .rightMargin) }
    
    @available(iOS 8.0, *)
    @objc(TopMargin)
    public var topMargin: MisterFusion { return createMisterFusion(with: .topMargin) }
    
    @available(iOS 8.0, *)
    @objc(BottomMargin)
    public var bottomMargin: MisterFusion { return createMisterFusion(with: .bottomMargin) }
    
    @available(iOS 8.0, *)
    @objc(LeadingMargin)
    public var leadingMargin: MisterFusion { return createMisterFusion(with: .leadingMargin) }
    
    @available(iOS 8.0, *)
    @objc(TrailingMargin)
    public var trailingMargin: MisterFusion { return createMisterFusion(with: .trailingMargin) }
    
    @available(iOS 8.0, *)
    @objc(CenterXWithinMargins)
    public var centerXWithinMargins: MisterFusion { return createMisterFusion(with: .centerXWithinMargins) }
    
    @available(iOS 8.0, *)
    @objc(CenterYWithinMargins)
    public var centerYWithinMargins: MisterFusion { return createMisterFusion(with: .centerYWithinMargins) }

    private func createMisterFusion(with attribute: NSLayoutAttribute) -> MisterFusion {
        return MisterFusion(item: self, attribute: attribute, relatedBy: nil, toItem: nil, toAttribute: nil, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: nil)
    }
}

extension UIView {
    //MARK: - addConstraint()
    func _addLayoutConstraint(_ misterFusion: MisterFusion) -> NSLayoutConstraint? {
        let item: LayoutObject = misterFusion.item ?? self
        let traitCollection = UIApplication.shared.keyWindow?.traitCollection
        if let horizontalSizeClass = misterFusion.horizontalSizeClass
            , horizontalSizeClass != traitCollection?.horizontalSizeClass {
            return nil
        }
        if let verticalSizeClass = misterFusion.verticalSizeClass
            , verticalSizeClass != traitCollection?.verticalSizeClass {
            return nil
        }
        let attribute: NSLayoutAttribute = misterFusion.attribute ?? .notAnAttribute
        let relatedBy: NSLayoutRelation = misterFusion.relatedBy ?? .equal
        let toAttribute: NSLayoutAttribute = misterFusion.toAttribute ?? attribute
        let toItem: LayoutObject? = toAttribute == .notAnAttribute ? nil : misterFusion.toItem ?? self
        let multiplier: CGFloat = misterFusion.multiplier ?? 1
        let constant: CGFloat = misterFusion.constant ?? 0
        let constraint = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relatedBy, toItem: toItem, attribute: toAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = misterFusion.priority ?? UILayoutPriorityRequired
        constraint.identifier = misterFusion.identifier
        addConstraint(constraint)
        return constraint
    }
    
    func _addLayoutConstraints(_ misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return misterFusions.flatMap { _addLayoutConstraint($0) }
    }

    //MARK: - addSubview()
    func _addLayoutSubview(_ subview: UIView, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }
    
    func _addLayoutSubview(_ subview: UIView, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }

    //MARK: - insertSubview(_ at:_)
    func _insertLayoutSubview(_ subview: UIView, at index: Int, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        insertSubview(subview, at: index)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }
    
    func _insertLayoutSubview(_ subview: UIView, at index: Int, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        insertSubview(subview, at: index)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }

    //MARK: - insertSubview(_ belowSubview:_)
    func _insertLayoutSubview(_ subview: UIView, belowSubview siblingSubview: UIView, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        insertSubview(subview, belowSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }
    
    func _insertLayoutSubview(_ subview: UIView, belowSubview siblingSubview: UIView, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        insertSubview(subview, belowSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }

    //MARK: - insertSubview(_ aboveSubview:_)
    func _insertLayoutSubview(_ subview: UIView, aboveSubview siblingSubview: UIView, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        insertSubview(subview, aboveSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }

    func _insertLayoutSubview(_ subview: UIView, aboveSubview siblingSubview: UIView, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        insertSubview(subview, aboveSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }
}
