//
//  BaseViewController.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit

private typealias `Self` = BaseViewController

/// Base View Controller
class BaseViewController: UIViewController, CustomizableNavigation, UIGestureRecognizerDelegate {
    // MARK: - Properties

    lazy var scrollView: BaseScrollView = {
        let scrollView = BaseScrollView()
        return scrollView
    }()

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

    // MARK: - Open Variables

    open var shouldAttachScrollView: Bool { return true }

    // MARK: - Open Functions

    @objc dynamic open func initializeUI() {}
    @objc dynamic open func updateViews() {}
    @objc dynamic open func setupViews() {}
    @objc dynamic open func setupActions() {}
    @objc dynamic open func fetchData() {}
    @objc dynamic open func updateButtonState() {}

    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if shouldAttachScrollView {
            attachScrollView()
        }
        initializeUI()
        setupViews()
        setupActions()
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

    // MARK: - View Creation
    private func attachScrollView() {
        view.addSubview(scrollView)
        scrollView.fillSuperviewSafeAreaLayoutGuide()
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
