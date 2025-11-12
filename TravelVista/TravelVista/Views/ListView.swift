//
//  ListView.swift
//  TravelVista
//
//  Created by Julien Cotte on 07/11/2025.
//

import SwiftUI

struct ListView: View {
    let regions: [Region] = Service().load("Source.json")
    private let viewModel = ListViewModel()

    var body: some View {
        List {
            ForEach(regions, id: \.name) { region in
                Section(header: Text(region.name)
                    .foregroundColor(.gray)) {
                    ForEach(region.countries, id: \.name) { country in
                        Button {
                            viewModel.openDetailView(for: country)
                        } label: {
                            CountryRow(country: country)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Liste de voyages")
    }
}

#Preview {
    ListView()
}
