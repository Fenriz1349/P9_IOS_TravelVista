//
//  ListView.swift
//  TravelVista
//
//  Created by Julien Cotte on 07/11/2025.
//

import SwiftUI

struct ListView: View {
    let regions: [Region] = Service().load("Source.json")

    var body: some View {
        List {
            ForEach(regions, id: \.name) { region in
                Section(header:
                            Text(region.name)
                            .foregroundColor(.gray)
                            .textCase(nil)
                ) {
                    ForEach(region.countries, id: \.name) { country in
                        NavigationLink(
                            destination: DetailViewRepresentable(country: country)
                                .navigationTitle(country.name)
                        ) {
                            CountryRow(country: country)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .navigationTitle("Liste de voyages")
    }
}

#Preview {
    ListView()
}
