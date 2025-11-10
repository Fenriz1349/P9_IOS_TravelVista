//
//  HostingListViewController.swift
//  TravelVista
//
//  Created by Julien Cotte on 07/11/2025.
//

import UIKit
import SwiftUI

final class HostingListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Liste de voyages"

        let swiftUIView = ListView()

        let hosting = UIHostingController(rootView: swiftUIView)
        addChild(hosting)
        hosting.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hosting.view)

        NSLayoutConstraint.activate([
            hosting.view.topAnchor.constraint(equalTo: view.topAnchor),
            hosting.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hosting.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hosting.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        hosting.didMove(toParent: self)
    }
}
