//
//  SecondViewController.swift
//  AccountUITesting
//
//  Created by 新垣 清奈 on 2022/08/30.
//

import UIKit

protocol StoryBoarded {
    static var storyBoardName: String { get }
    static func instantiate() -> UIViewController
}

extension StoryBoarded where Self: UIViewController {
    static var storyBoardName: String {
        "Main"
    }
    static func instantiate() -> UIViewController {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self))
    }
}

class SecondViewController: UIViewController, StoryBoarded {
    static var storyBoardName: String {
        "SecondViewController"
    }
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Successfully Log In!"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
    }

}
