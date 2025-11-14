//
//  DetailViewRepresentable.swift
//  TravelVista
//
//  Created by Julien Cotte on 13/11/2025.
//

import SwiftUI
import UIKit

struct DetailViewRepresentable: UIViewControllerRepresentable {
    let country: Country

    func makeUIViewController(context: Context) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.country = country
        return detailViewController
    }

    func updateUIViewController(_ uiViewController: DetailViewController, context: Context) {
    }
}
