//
//  ListViewModel.swift
//  TravelVista
//
//  Created by Julien Cotte on 10/11/2025.
//

import UIKit

final class ListViewModel {
    func openDetailView(for country: Country) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }

        detailVC.country = country

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first(where: { $0.isKeyWindow }),
           let root = window.rootViewController {

            if let nav = root as? UINavigationController {
                nav.pushViewController(detailVC, animated: true)
            } else if let nav = root.navigationController {
                nav.pushViewController(detailVC, animated: true)
            } else {
                root.present(detailVC, animated: true)
            }
        }
    }
}

