//
//  CustomizableNavigation.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import Foundation
import UIKit
import SnapKit

/// It holds all required things for a type to specify the requirement of
/// how the navigation bar with all of it's items look like and behave.
public protocol CustomizableNavigation {
    /// Specify this property to determine the navigation bar background color.
    var barBackgroundColor: UIColor { get }

    /// Specify this property to determine whether or not the navigation bar
    /// would use shadow. Set the value to false to remove a *strange*
    /// line at the bottom of navigation bar.
    var isBarUsingBottomShadow: Bool { get }

    /// Specify this property to determine which title color that would be used
    /// at the midst of navigation bar.
    var titleColor: UIColor { get }

    /// Specify this property to determine which title font that would be used
    /// at the midst of navigation bar.
    var titleFont: UIFont { get }

    var titleText: String? { get }

    /// Specify this property to determine the image that would be used as
    /// the back button's image.
    var backImage: UIImage? { get }

    /// Specify this property to determine the text that would be used at
    /// the right of the back button's image.
    var backText: String? { get }

    /// Specify this property to enlarge back button width frame
    /// the right of the back button's image.
    var backInset: UIEdgeInsets? { get }

    /// Specify this property to determine whether or not the screen could be
    /// dragged from left to right to go to the previous screen.
    var isUsingInteractivePopGesture: Bool { get }

    /// Update the navigation configuration based on the specified properties.
    func updateNavigation()

    /// Reset the navigation configuration.
    func resetNavigation()
}

public extension CustomizableNavigation where Self: UIViewController, Self: UIGestureRecognizerDelegate {
    var barBackgroundColor: UIColor { return .white }
    var isBarUsingBottomShadow: Bool { return true }
    var titleColor: UIColor { return .black }
    var titleFont: UIFont { return .systemFont(ofSize: 17) }
    var backImage: UIImage? { return nil }
    var backText: String? { return nil }
    var backInset: UIEdgeInsets? { return .zero }
    var titleText: String? { return nil }
    var isUsingInteractivePopGesture: Bool { return true }

    func updateNavigation() {
        let navigationBar = navigationController?.navigationBar

        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = isBarUsingBottomShadow ? nil : UIImage()

        // var barView = navigationBar?.subviews.first?.subviews.first
        var barView = navigationBar?.subviews.first?.viewWithTag(281493456) // fixed iOS 13

        if barView == nil || barView != nil && type(of: barView!) != UIView.self {
            barView = UIView(frame: CGRect.zero)
            barView?.tag = 281493456 // fixed iOS 13

            if let navBarSize = navigationBar?.frame.size {
                let statusBarSize = statusBarHeight
                barView?.frame.size = CGSize(
                    width: navBarSize.width,
                    height: navBarSize.height + statusBarSize
                )
            }

            navigationBar?.subviews.first?.insertSubview(barView!, at: 0)
        }

        let titleView = UIView()
        let label = UILabel(text: self.titleText,
                            font: self.titleFont,
                            textColor: self.titleColor,
                            textAlignment: .center,
                            numberOfLines: 1)
        titleView.backgroundColor = .clear

        if let navBar = self.navigationController?.navigationBar {
            let frame = CGRect(x: 0,
                               y: 0,
                               width: navBar.bounds.width,
                               height: navBar.bounds.height)
            titleView.frame = frame

            titleView.addSubview(label)
            label.snp.makeConstraints { maker in
                maker.leading.equalToSuperview()
                maker.centerY.equalToSuperview()
                maker.trailing.equalToSuperview()
                maker.centerX.equalToSuperview()
            }

            // iOS 11 must use constraint
            titleView.widthAnchor.constraint(equalToConstant: navBar.bounds.width - 64 - 64).isActive = true
            titleView.heightAnchor.constraint(equalToConstant: navBar.bounds.height).isActive = true
        }

        barView?.backgroundColor = barBackgroundColor

        navigationItem.leftBarButtonItems = []

        if let backImage = backImage {
            let imageButtonFrame = CGRect(
                x: 0,
                y: 0,
                width: backImage.size.width + 20,
                height: backImage.size.height + 100
            )
            let imageButton = UIButton(frame: imageButtonFrame)
            imageButton.contentEdgeInsets = backInset ?? .zero
            imageButton.setImage(backImage, for: .normal)
            imageButton.contentMode = .left
            imageButton.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)

            let imageBarButtonItem = UIBarButtonItem(customView: imageButton)
            navigationItem.leftBarButtonItems?.append(imageBarButtonItem)
        }

        if let backText = backText {
            let textBarButtonItem = UIBarButtonItem(title: backText,
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(backTapped(_:)))
            navigationItem.leftBarButtonItems?.append(textBarButtonItem)
        }

        navigationItem.leftBarButtonItems?.append(UIBarButtonItem.init(customView: titleView) )

        let interactivePopRecognizer = navigationController?.interactivePopGestureRecognizer
        interactivePopRecognizer?.isEnabled = isUsingInteractivePopGesture
        interactivePopRecognizer?.delegate = self

        self.title = nil
    }

    func resetNavigation() {
        let navigationBar = navigationController?.navigationBar

        navigationBar?.subviews.first?.subviews.first?.removeFromSuperview()
        navigationBar?.setBackgroundImage(nil, for: .default)
        navigationBar?.shadowImage = nil
        navigationBar?.titleTextAttributes = nil
    }
}

public extension UIViewController {
    /// Action that will be executed when the navigation bar has back button and it's tapped.
    ///
    /// - Parameter sender: The sender of action.
    @objc func backTapped(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    var statusBarHeight: CGFloat {
        if #available(iOS 13, *) {
            return view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
}
