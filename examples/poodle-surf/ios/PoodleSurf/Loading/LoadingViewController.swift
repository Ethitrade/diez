//
//  LoadingViewController.swift
//  PoodleSurf
//
//  Created by Westin Newell on 4/9/19.
//  Copyright © 2019 Haiku. All rights reserved.
//

import UIKit
import Diez
import Lottie

class LoadingViewController: UIViewController {
    private let diezDesignSystem = Diez<DesignSystem>()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyle(to: loadingView)

        diezDesignSystem.attach(self) { [weak self] system in
            self?.apply(system)
        }
    }

    private func apply(_ system: DesignSystem){
        apply(system.loading, to: loadingView)
    }

    private func apply(_ design: LoadingDesign, to view: LoadingView) {
        view.backgroundColor = design.backgroundColor.color

        guard let animationView = design.animation.view() else {
            print("Failed to load lottie animation view.")
            return
        }

        view.setAnimationView(to: animationView)
    }

    // MARK: - Local Styling

    private func applyStyle(to view: LoadingView) {
        view.backgroundColor = UIColor(red: 120/255, green: 207/255, blue: 253/255, alpha: 1)
        loadingView.setAnimationView(to: LOTAnimationView(name: "hang10"))
    }

    private var loadingView: LoadingView {
        return view as! LoadingView
    }

    override func loadView() {
        view = LoadingView()
    }

    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) { fatalError("\(#function) not implemented.") }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("\(#function) not implemented.") }
}
