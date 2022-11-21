//
//  ViewController.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit

class ViewController: BaseViewController {
    // MARK: - Properties

    lazy var welcomeLabel: UILabel = {
        let view = UILabel()
        view.text = "Welcome to Template Project"
        view.font = .boldSystemFont(ofSize: 30)
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black
    }
}
