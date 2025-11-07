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
                    .fontWeight(.medium)
                    .foregroundColor(.customBlue)
                Text(country.capital)
                    .font(.title2)
                    .foregroundColor(.gray)
            }

            Spacer()

            HStack(spacing: 4) {
                ForEach(0..<country.rate, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .padding()
    }
}

#Preview {
    TitleView(country: PreviewDataProvider.previewCountry)
}
