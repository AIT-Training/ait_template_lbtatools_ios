//
//  BaseScrollView.swift
//  ait_template_lbtatools
//
//  Created by Faerae on 21/11/22.
//

import UIKit
import SnapKit

class BaseScrollView: UIScrollView {
    // MARK: - Properties

    lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview().priority(.low)
            make.width.equalToSuperview()
        }
    }

    func addSubviewToContentView(_ view: UIView) {
        contentView.addSubview(view)
    }
}
