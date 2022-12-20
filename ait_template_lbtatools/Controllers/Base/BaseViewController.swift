//
//  BaseViewController.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit
import AITBase

private typealias `Self` = BaseViewController

/// Base View Controller
class BaseViewController: AITBaseViewController, CustomizableNavigation, UIGestureRecognizerDelegate {
    // MARK: - Properties

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Navigation Configs

    var titleFont: UIFont { return .boldSystemFont(ofSize: 24) }
    var titleColor: UIColor { return .white }
    var barBackgroundColor: UIColor { return .clear }
    var backImage: UIImage? { return nil }
    var isBarUsingBottomShadow: Bool { return false }
    var backInset: UIEdgeInsets? { return .zero }
    var titleText: String? { return nil }
    var isUsingInteractivePopGesture: Bool { return true }

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateNavigation()
        updateViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        updateNavigation()
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
