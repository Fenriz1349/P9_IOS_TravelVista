//
//  TitleView.swift
//  TravelVista
//
//  Created by Julien Cotte on 07/11/2025.
//

import SwiftUI

struct TitleView: View {
    let country: Country

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                Text(country.capital)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            HStack(spacing: 4) {
                ForEach(0..<country.rate, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                }
            }
        }
        .padding()
    }
}

#Preview {
    TitleView(country: PreviewDataProvider.previewCountry)
}
