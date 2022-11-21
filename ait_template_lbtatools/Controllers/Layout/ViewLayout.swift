//
//  ViewLayout.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit

extension ViewController {
    override func initializeUI() {
        super.initializeUI()

        let view = scrollView.contentView
        view.hstack(
            welcomeLabel,
            alignment: .center
        ).withMargins(.allSides(32))
    }
}
