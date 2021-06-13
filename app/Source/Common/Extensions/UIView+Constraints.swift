//
//  UIView+Constraints.swift
//  App
//
//  Created by Ney Moura on 13/06/21.
//

import UIKit

extension NSLayoutConstraint {
    func set(id: String? = nil, priority: UILayoutPriority? = nil, isActive: Bool = true) {
        identifier = id
        if let priority = priority { self.priority = priority }
        self.isActive = isActive
    }
}

extension UIView {
    
    @discardableResult
    func width(id: String? = nil,
               anchor: NSLayoutDimension,
               multiplier: CGFloat = 1,
               constant: CGFloat = 0,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func width(id: String? = nil,
               constant: CGFloat,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalToConstant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func width(id: String? = nil,
               lessThanOrEqualTo anchor: NSLayoutDimension,
               multiplier: CGFloat = 1,
               constante: CGFloat = 0,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func width(id: String? = nil,
               greaterThanOrEqualTo anchor: NSLayoutDimension,
               multiplier: CGFloat = 1,
               constante: CGFloat = 0,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func width(id: String? = nil,
               greaterThanOrEqualToConstant constante: CGFloat,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func width(id: String? = nil,
               lessThanOrEqualToConstant constante: CGFloat,
               priority: UILayoutPriority? = nil,
               isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func height(id: String? = nil,
                anchor: NSLayoutDimension,
                multiplier: CGFloat = 1,
                constant: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func height(id: String? = nil, constant: CGFloat, priority: UILayoutPriority? = nil, isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(equalToConstant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func height(id: String? = nil,
                lessThanOrEqualTo anchor: NSLayoutDimension,
                multiplier: CGFloat = 1,
                constante: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func height(id: String? = nil,
                greaterThanOrEqualTo anchor: NSLayoutDimension,
                multiplier: CGFloat = 1,
                constante: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func height(id: String? = nil,
                greaterThanOrEqualToConstant constante: CGFloat,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func height(id: String? = nil,
                lessThanOrEqualToConstant constante: CGFloat,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constante)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func centerY(id: String? = nil,
                 _ centerY: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                 constant: CGFloat = 0,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> UIView {
        let constraint = centerYAnchor.constraint(equalTo: centerY, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func centerX(id: String? = nil,
                 _ centerX: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: CGFloat = 0,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> UIView {
        let constraint = centerXAnchor.constraint(equalTo: centerX, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func top(id: String? = nil,
             anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
             constant: CGFloat = 0,
             priority: UILayoutPriority? = nil,
             isActive: Bool = true) -> UIView {
        let constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func top(id: String? = nil,
             lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
             constant: CGFloat = 0,
             priority: UILayoutPriority? = nil,
             isActive: Bool = true) -> UIView {
        let constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func top(id: String? = nil,
             greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
             constant: CGFloat = 0,
             priority: UILayoutPriority? = nil,
             isActive: Bool = true) -> UIView {
        let constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil,
                 anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: CGFloat = 0,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> UIView {
        let constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil,
                 lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: CGFloat = 0,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> UIView {
        let constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func leading(id: String? = nil,
                 greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                 constant: CGFloat = 0,
                 priority: UILayoutPriority? = nil,
                 isActive: Bool = true) -> UIView {
        let constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil,
                  anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                  constant: CGFloat = 0,
                  priority: UILayoutPriority? = nil,
                  isActive: Bool = true) -> UIView {
        let constraint = trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil,
                  lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                  constant: CGFloat = 0,
                  priority: UILayoutPriority? = nil,
                  isActive: Bool = true) -> UIView {
        let constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func trailing(id: String? = nil,
                  greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
                  constant: CGFloat = 0,
                  priority: UILayoutPriority? = nil,
                  isActive: Bool = true) -> UIView {
        let constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil,
                anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                constant: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil,
                lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                constant: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func bottom(id: String? = nil,
                greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                constant: CGFloat = 0,
                priority: UILayoutPriority? = nil,
                isActive: Bool = true) -> UIView {
        let constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func firstBaseline(id: String? = nil,
                       anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                       constant: CGFloat = 0,
                       priority: UILayoutPriority? = nil,
                       isActive: Bool = true) -> UIView {
        let constraint = firstBaselineAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
    
    @discardableResult
    func lastBaseline(id: String? = nil,
                      anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
                      constant: CGFloat = 0,
                      priority: UILayoutPriority? = nil,
                      isActive: Bool = true) -> UIView {
        let constraint = lastBaselineAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.set(id: id, priority: priority, isActive: isActive)
        return self
    }
}

extension UIView {
    func constraint(id: String) -> NSLayoutConstraint? {
        if let constraint = superview?.constraints.first(where: { $0.identifier == id }) {
            return constraint
        }
        return constraints.first(where: { $0.identifier == id })
    }
}

extension UIView {
    func addSubView(withEqualConstraintWith addedView: UIView, withEqualMargins margin: CGFloat = 0) {
        addSubview(addedView)
        addedView
            .useConstraint()
            .top(anchor: topAnchor, constant: margin)
            .leading(anchor: leadingAnchor, constant: margin)
            .trailing(anchor: trailingAnchor, constant: -margin)
            .bottom(anchor: bottomAnchor, constant: -margin)
    }
}

extension UIView {
    
    @discardableResult
    func useConstraint() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    func dontUseConstraint() -> Self {
        translatesAutoresizingMaskIntoConstraints = true
        return self
    }
    
    @discardableResult
    func disableUserInteraction() -> Self {
        isUserInteractionEnabled = false
        return self
    }
    
    @discardableResult
    func enableUserInteraction() -> Self {
        isUserInteractionEnabled = true
        return self
    }
    
    func removeAllConstraints() {
        NSLayoutConstraint.deactivate(self.constraints)
    }
}
