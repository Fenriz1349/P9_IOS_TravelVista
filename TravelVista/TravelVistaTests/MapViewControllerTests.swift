//
//  MapViewControllerTests.swift
//  TravelVista
//
//  Created by Julien Cotte on 03/11/2025.
//

import XCTest
import MapKit
@testable import TravelVista

final class MapViewControllerTests: XCTestCase {

    func test_SetUpData_AssignsCoordinatesAndCapital() {
        // Given
        let controller = MapViewController()
        _ = controller.view
        let expectedLat = 59.9139
        let expectedLong = 10.7522
        let expectedCapital = "Oslo"

        // When
        controller.setUpData(capitalName: expectedCapital, lat: expectedLat, long: expectedLong)

        // Then
        XCTAssertNotNil(controller.coordinates)
        XCTAssertEqual(controller.capitalName, expectedCapital)

        guard let lat = controller.coordinates?.latitude,
              let long = controller.coordinates?.longitude else {
            XCTFail("Coordinates should not be nil")
            return
        }
        
        XCTAssertEqual(lat, expectedLat, accuracy: 0.0001)
        XCTAssertEqual(long, expectedLong, accuracy: 0.0001)
    }
}
