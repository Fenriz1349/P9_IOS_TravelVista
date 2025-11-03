//
//  ModelTests.swift
//  TravelVista
//
//  Created by Julien Cotte on 03/11/2025.
//

import XCTest
@testable import TravelVista

final class ModelTests: XCTestCase {
    func test_JSONDecoding_LoadsContinentsAndCountries() throws {
        // Given
        guard let url = Bundle(for: Self.self).url(forResource: "Source", withExtension: "json") else {
            XCTFail("Source.json not found in bundle")
            return
        }

        let data = try Data(contentsOf: url)

        // When
        let continents = try JSONDecoder().decode([Region].self, from: data)

        // Then
        XCTAssertFalse(continents.isEmpty, "Continents list should not be empty")
        XCTAssertEqual(continents.first?.name, "Europe")

        let europe = continents.first(where: { $0.name == "Europe" })
        XCTAssertNotNil(europe)
        XCTAssertEqual(europe?.countries.first?.name, "Norvège")
        XCTAssertEqual(europe?.countries.first?.capital, "Oslo")
        XCTAssertEqual(europe?.countries.first?.coordinates.latitude ?? 0, 59.9139, accuracy: 0.001)
    }
}
