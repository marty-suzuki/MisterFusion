//
//  Deprecated.swift
//  MisterFusion
//
//  Created by marty-suzuki on 2017/05/05.
//  Copyright © 2017年 Taiki Suzuki. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

//@available(*, deprecated, message: "Those methods will be removed since 3.0.0, please use view.mf.xxx instead.")
extension View {
    //MARK: - addConstraint()
    @discardableResult
    @objc public func addLayoutConstraint(_ misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return _addLayoutConstraint(misterFusion)
    }
    
    @discardableResult
    @objc public func addLayoutConstraints(_ misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return _addLayoutConstraints(misterFusions)
    }
    
    @discardableResult
    public func addLayoutConstraints(_ misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return _addLayoutConstraints(misterFusions)
    }
    
    //MARK: - addSubview()
    @discardableResult
    @objc public func addLayoutSubview(_ subview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return _addLayoutSubview(subview, andConstraint: misterFusion)
    }
    
    @discardableResult
    @objc public func addLayoutSubview(_ subview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return _addLayoutSubview(subview, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func addLayoutSubview(_ subview: View, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return _addLayoutSubview(subview, andConstraints: misterFusions)
    }
}

#if os(iOS) || os(tvOS)
extension View {
    //MARK: - insertSubview(_ at:_)
    @objc(insertLayoutSubview:atIndex:andConstraint:)
    @discardableResult
    public func insertLayoutSubview(_ subview: View, at index: Int, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return _insertLayoutSubview(subview, at: index, andConstraint: misterFusion)
    }
    
    @objc(insertLayoutSubview:atIndex:andConstraints:)
    @discardableResult
    public func insertLayoutSubview(_ subview: View, at index: Int, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return _insertLayoutSubview(subview, at: index, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func insertLayoutSubview(_ subview: View, at index: Int, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return _insertLayoutSubview(subview, at: index, andConstraints: misterFusions)
    }
    
    //MARK: - insertSubview(_ belowSubview:_)
    @discardableResult
    @objc public func insertLayoutSubview(_ subview: View, belowSubview siblingSubview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return _insertLayoutSubview(subview, belowSubview: siblingSubview, andConstraint: misterFusion)
    }
    
    @discardableResult
    @objc public func insertLayoutSubview(_ subview: View, belowSubview siblingSubview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return _insertLayoutSubview(subview, belowSubview: siblingSubview, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func insertLayoutSubview(_ subview: View, belowSubview siblingSubview: View, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return _insertLayoutSubview(subview, belowSubview: siblingSubview, andConstraints: misterFusions)
    }
    
    //MARK: - insertSubview(_ aboveSubview:_)
    @discardableResult
    @objc public func insertLayoutSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return _insertLayoutSubview(subview, aboveSubview: siblingSubview, andConstraint: misterFusion)
    }

    @discardableResult
    @objc public func insertLayoutSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return _insertLayoutSubview(subview, aboveSubview: siblingSubview, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func insertLayoutSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return _insertLayoutSubview(subview, aboveSubview: siblingSubview, andConstraints: misterFusions)
    }
}
#endif
