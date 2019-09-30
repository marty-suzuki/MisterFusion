//
//  MisterFusion.swift
//  MisterFusion
//
//  Created by Taiki Suzuki on 2015/11/13.
//  Copyright © 2015年 Taiki Suzuki. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
public typealias View = UIView
@available(iOS 9.0, *)
public typealias LayoutGuide = UILayoutGuide
public typealias LayoutPriority = UILayoutPriority
public typealias UserInterfaceSizeClass = UIUserInterfaceSizeClass
#elseif os(macOS)
import AppKit
public typealias View = NSView
public typealias LayoutGuide = NSLayoutGuide
public typealias LayoutPriority = NSLayoutConstraint.Priority
public typealias UserInterfaceSizeClass = Void
#endif

#if swift(>=4.2) || os(macOS)
public typealias Attribute = NSLayoutConstraint.Attribute
public typealias Relation = NSLayoutConstraint.Relation
#elseif os(iOS) || os(tvOS)
public typealias Attribute = NSLayoutAttribute
public typealias Relation = NSLayoutRelation
#endif

protocol _LayoutObject: class {
    var rawValue: Any { get }
}

extension View: _LayoutObject {
    var rawValue: Any { return self }
}

@available(iOS 9.0, OSX 10.11, *)
extension LayoutGuide: _LayoutObject {
    var rawValue: Any { return self }
}

public class MisterFusion: NSObject {

    fileprivate let item: _LayoutObject?
    fileprivate let attribute: Attribute?
    fileprivate let relatedBy: Relation?
    fileprivate let toItem: _LayoutObject?
    fileprivate let toAttribute: Attribute?
    fileprivate let multiplier: CGFloat?
    fileprivate let constant: CGFloat?
    fileprivate let priority: LayoutPriority?
    fileprivate let horizontalSizeClass: UserInterfaceSizeClass?
    fileprivate let verticalSizeClass: UserInterfaceSizeClass?
    fileprivate let identifier: String?
    
    override open var description: String {
        #if os(iOS) || os(tvOS)
        return "\(super.description)\n" +
               "item               : \(item as _LayoutObject?)\n" +
               "attribute          : \(attribute as Attribute?))\n" +
               "relatedBy          : \(relatedBy as Relation?))\n" +
               "toItem             : \(toItem as _LayoutObject?)\n" +
               "toAttribute        : \(toAttribute as Attribute?))\n" +
               "multiplier         : \(multiplier as CGFloat?)\n" +
               "constant           : \(constant as CGFloat?)\n" +
               "priority           : \(priority as LayoutPriority?)\n" +
               "horizontalSizeClass: \(horizontalSizeClass as UserInterfaceSizeClass?)\n" +
               "verticalSizeClass  : \(verticalSizeClass as UserInterfaceSizeClass?)\n"
        #elseif os(macOS)
        return "\(super.description)\n" +
                "item               : \(item as _LayoutObject?)\n" +
                "attribute          : \(attribute as Attribute?))\n" +
                "relatedBy          : \(relatedBy as Relation?))\n" +
                "toItem             : \(toItem as _LayoutObject?)\n" +
                "toAttribute        : \(toAttribute as Attribute?))\n" +
                "multiplier         : \(multiplier as CGFloat?)\n" +
                "constant           : \(constant as CGFloat?)\n" +
                "priority           : \(priority as LayoutPriority?)\n"
        #endif
    }

    init(item: _LayoutObject?, attribute: Attribute?, relatedBy: Relation?, toItem: _LayoutObject?, toAttribute: Attribute?, multiplier: CGFloat?, constant: CGFloat?, priority: LayoutPriority?, horizontalSizeClass: UserInterfaceSizeClass?, verticalSizeClass: UserInterfaceSizeClass?, identifier: String?) {
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

    @objc public var Equal: (MisterFusion) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |==| $0
        }
    }

    @objc public var NotRelatedEqualConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |==| $0
        }
    }

    @objc public var LessThanOrEqual: (MisterFusion) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |<=| $0
        }
    }

    @objc public var NotRelatedLessThanOrEqualConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |<=| $0
        }
    }

    @objc public var GreaterThanOrEqual: (MisterFusion) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |>=| $0
        }
    }

    @objc public var NotRelatedGreaterThanOrEqualConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |>=| $0
        }
    }

    @objc public var Multiplier: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |*| $0
        }
    }

    @objc public var Constant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |+| $0
        }
    }

    @objc public var Priority: (LayoutPriority) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |<>| $0
        }
    }

    @objc public var NotRelatedConstant: (CGFloat) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me |==| $0
        }
    }

    #if os(iOS) || os(tvOS)
    @objc public var HorizontalSizeClass: (UserInterfaceSizeClass) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me <-> $0
        }
    }

    @objc public var VerticalSizeClass: (UserInterfaceSizeClass) -> MisterFusion? {
        return { [weak self] in
            guard let me = self else { return nil }
            return me <|> $0
        }
    }
    #endif
    
    @objc public var Identifier: (String) -> MisterFusion? {
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
public func |<>| (left: MisterFusion, right: LayoutPriority) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: right, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator <-> : MisterFusionAdditive
public func <-> (left: MisterFusion, right: UserInterfaceSizeClass) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: left.priority, horizontalSizeClass: right, verticalSizeClass: left.verticalSizeClass, identifier: left.identifier)
}

infix operator <|> : MisterFusionAdditive
public func <|> (left: MisterFusion, right: UserInterfaceSizeClass) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: right, identifier: left.identifier)
}

infix operator -=- : MisterFusionAdditive
public func -=- (left: MisterFusion, right: String) -> MisterFusion {
    return MisterFusion(item: left.item, attribute: left.attribute, relatedBy: left.relatedBy, toItem: left.toItem, toAttribute: left.toAttribute, multiplier: left.multiplier, constant: left.constant, priority: left.priority, horizontalSizeClass: left.horizontalSizeClass, verticalSizeClass: left.verticalSizeClass, identifier: right)
}

extension View: MisterFusionConvertible {
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
    
    @objc(NotAnAttribute)
    public var notAnAttribute: MisterFusion { return createMisterFusion(with: .notAnAttribute) }
    
    @objc(LastBaseline)
    public var lastBaseline: MisterFusion { return createMisterFusion(with: .lastBaseline) }
    
    @objc(FirstBaseline)
    public var firstBaseline: MisterFusion { return createMisterFusion(with: .firstBaseline) }

    private func createMisterFusion(with attribute: Attribute) -> MisterFusion {
        return MisterFusion(item: self, attribute: attribute, relatedBy: nil, toItem: nil, toAttribute: nil, multiplier: nil, constant: nil, priority: nil, horizontalSizeClass: nil, verticalSizeClass: nil, identifier: nil)
    }
}

#if os(iOS) || os(tvOS)
extension View {
    @objc(LeftMargin)
    public var leftMargin: MisterFusion { return createMisterFusion(with: .leftMargin) }
    
    @objc(RightMargin)
    public var rightMargin: MisterFusion { return createMisterFusion(with: .rightMargin) }
    
    @objc(TopMargin)
    public var topMargin: MisterFusion { return createMisterFusion(with: .topMargin) }
    
    @objc(BottomMargin)
    public var bottomMargin: MisterFusion { return createMisterFusion(with: .bottomMargin) }
    
    @objc(LeadingMargin)
    public var leadingMargin: MisterFusion { return createMisterFusion(with: .leadingMargin) }
    
    @objc(TrailingMargin)
    public var trailingMargin: MisterFusion { return createMisterFusion(with: .trailingMargin) }
    
    @objc(CenterXWithinMargins)
    public var centerXWithinMargins: MisterFusion { return createMisterFusion(with: .centerXWithinMargins) }
    
    @objc(CenterYWithinMargins)
    public var centerYWithinMargins: MisterFusion { return createMisterFusion(with: .centerYWithinMargins) }
}
#endif

extension View {
    //MARK: - addConstraint()
    func _addLayoutConstraint(_ misterFusion: MisterFusion) -> NSLayoutConstraint? {
        let item: _LayoutObject = misterFusion.item ?? self

        #if os(iOS) || os(tvOS)
        let traitCollection = window?.traitCollection
        if let horizontalSizeClass = misterFusion.horizontalSizeClass
            , horizontalSizeClass != traitCollection?.horizontalSizeClass {
            return nil
        }
        if let verticalSizeClass = misterFusion.verticalSizeClass
            , verticalSizeClass != traitCollection?.verticalSizeClass {
            return nil
        }
        #endif

        let attribute: Attribute = misterFusion.attribute ?? .notAnAttribute
        let relatedBy: Relation = misterFusion.relatedBy ?? .equal
        let toAttribute: Attribute = misterFusion.toAttribute ?? attribute
        let toItem: _LayoutObject? = toAttribute == .notAnAttribute ? nil : misterFusion.toItem ?? self
        let multiplier: CGFloat = misterFusion.multiplier ?? 1
        let constant: CGFloat = misterFusion.constant ?? 0
        let constraint = NSLayoutConstraint(item: item.rawValue, attribute: attribute, relatedBy: relatedBy, toItem: toItem?.rawValue, attribute: toAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = misterFusion.priority ?? .required
        constraint.identifier = misterFusion.identifier
        addConstraint(constraint)
        return constraint
    }
    
    func _addLayoutConstraints(_ misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        #if swift(>=4.1)
        return misterFusions.compactMap { _addLayoutConstraint($0) }
        #else
        return misterFusions.flatMap { _addLayoutConstraint($0) }
        #endif
    }

    //MARK: - addSubview()
    func _addLayoutSubview(_ subview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }
    
    func _addLayoutSubview(_ subview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }
}

#if os(iOS) || os(tvOS)
extension View {
    //MARK: - insertSubview(_ at:_)
    func _insertLayoutSubview(_ subview: View, at index: Int, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        insertSubview(subview, at: index)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }
    
    func _insertLayoutSubview(_ subview: View, at index: Int, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        insertSubview(subview, at: index)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }

    //MARK: - insertSubview(_ belowSubview:_)
    func _insertLayoutSubview(_ subview: View, belowSubview siblingSubview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        insertSubview(subview, belowSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }
    
    func _insertLayoutSubview(_ subview: View, belowSubview siblingSubview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        insertSubview(subview, belowSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }

    //MARK: - insertSubview(_ aboveSubview:_)
    func _insertLayoutSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        insertSubview(subview, aboveSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraint(misterFusion)
    }

    func _insertLayoutSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        insertSubview(subview, aboveSubview: siblingSubview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        return _addLayoutConstraints(misterFusions)
    }
}
#endif
