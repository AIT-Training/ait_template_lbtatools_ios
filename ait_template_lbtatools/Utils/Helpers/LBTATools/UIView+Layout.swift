//
//  UIView+Layout.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit
import LBTATools

extension UIView {
    fileprivate func _vstack(
        _ axis: NSLayoutConstraint.Axis = .vertical,
        views: [UIView],
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        addSubview(stackView)
        stackView.fillSuperview()
        return stackView
    }

    @discardableResult
    public func vstack(
        _ views: UIView...,
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) -> UIStackView {
        return _vstack(
            .vertical,
            views: views,
            spacing: spacing,
            alignment: alignment,
            distribution: distribution
        )
    }

    public func addSubViews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}
