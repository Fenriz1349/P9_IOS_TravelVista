//
//  CountryRow.swift
//  TravelVista
//
//  Created by Julien Cotte on 07/11/2025.
//

import SwiftUI

struct CountryRow: View {
    let country: Country

    var body: some View {
        HStack {
            Image(country.pictureName)
                .resizable()
                .frame(width: 52, height: 52)
                .cornerRadius(25)
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.customBlue)
                Text(country.capital)
            }

            Spacer()

            HStack(spacing: 4) {
                Text("\(country.rate)")
                Image(systemName: "star.fill")
                    .foregroundColor(.accentColor)
            }
            .font(.system(size: 20))
        }
    }
}

#Preview {
    CountryRow(country: PreviewDataProvider.previewCountry)
}
