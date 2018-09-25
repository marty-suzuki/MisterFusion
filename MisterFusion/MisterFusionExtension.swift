//
//  MisterFusionExtension.swift
//  MisterFusion
//
//  Created by Taiki Suzuki on 2017/01/20.
//  Copyright © 2017年 Taiki Suzuki. All rights reserved
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public struct MisterFusionExtension {
    let base: View
    init(_ base: View) {
        self.base = base
    }
}

extension View {
    public var mf: MisterFusionExtension {
        return MisterFusionExtension(self)
    }
}

extension MisterFusionExtension {
    //MARK: - addConstraint()
    @discardableResult
    public func addConstraint(_ misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return base._addLayoutConstraint(misterFusion)
    }
    
    @discardableResult
    public func addConstraints(_ misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return base._addLayoutConstraints(misterFusions)
    }
    
    @discardableResult
    public func addConstraints(_ misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return base._addLayoutConstraints(misterFusions)
    }
    
    //MARK: - addSubview()
    @discardableResult
    public func addSubview(_ subview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return base._addLayoutSubview(subview, andConstraint: misterFusion)
    }
    
    @discardableResult
    public func addSubview(_ subview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return base._addLayoutSubview(subview, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func addSubview(_ subview: View, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return base._addLayoutSubview(subview, andConstraints: misterFusions)
    }
}

#if os(iOS) || os(tvOS)
extension MisterFusionExtension {
    //MARK: - insertSubview(_ at:_)
    @discardableResult
    public func insertSubview(_ subview: View, at index: Int, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return base._insertLayoutSubview(subview, at: index, andConstraint: misterFusion)
    }
    
    @discardableResult
    public func insertSubview(_ subview: View, at index: Int, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return base._insertLayoutSubview(subview, at: index, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func insertSubview(_ subview: View, at index: Int, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return base._insertLayoutSubview(subview, at: index, andConstraints: misterFusions)
    }
    
    //MARK: - insertSubview(_ belowSubview:_)
    @discardableResult
    public func insertSubview(_ subview: View, belowSubview siblingSubview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return base._insertLayoutSubview(subview, belowSubview: siblingSubview, andConstraint: misterFusion)
    }
    
    @discardableResult
    public func insertSubview(_ subview: View, belowSubview siblingSubview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return base._insertLayoutSubview(subview, belowSubview: siblingSubview, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func insertSubview(_ subview: View, belowSubview siblingSubview: View, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return base._insertLayoutSubview(subview, belowSubview: siblingSubview, andConstraints: misterFusions)
    }
    
    //MARK: - insertSubview(_ aboveSubview:_)
    @discardableResult
    public func insertSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraint misterFusion: MisterFusion) -> NSLayoutConstraint? {
        return base._insertLayoutSubview(subview, aboveSubview: siblingSubview, andConstraint: misterFusion)
    }
    
    @discardableResult
    public func insertSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraints misterFusions: [MisterFusion]) -> [NSLayoutConstraint] {
        return base._insertLayoutSubview(subview, aboveSubview: siblingSubview, andConstraints: misterFusions)
    }
    
    @discardableResult
    public func insertSubview(_ subview: View, aboveSubview siblingSubview: View, andConstraints misterFusions: MisterFusion...) -> [NSLayoutConstraint] {
        return base._insertLayoutSubview(subview, aboveSubview: siblingSubview, andConstraints: misterFusions)
    }
}
#endif
