//
//  BaseView.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit

class BaseView: UIView {
    // MARK: - Open Functions

    open func setupView() {}
    open func setupActions() {}

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupActions()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
        setupActions()
    }

    init() {
        super.init(frame: CGRect.zero)

        setupView()
        setupActions()
    }
}
