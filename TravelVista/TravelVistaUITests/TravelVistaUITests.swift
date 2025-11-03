//
//  TravelVistaUITests.swift
//  TravelVistaUITests
//
//  Created by Julien Cotte on 31/10/2025.
//

import XCTest

final class TravelVistaUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    // MARK: - List Screen

    func test_CountryList_ShowsSectionsAndCountries() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.tables.firstMatch.exists)

        // Scroll to ensure all sections are visible
        let table = app.tables.firstMatch
        table.swipeUp()
        table.swipeUp()
        table.swipeDown()

        let sections = ["Europe", "Asie", "Oceanie", "Afrique", "Ameriques"]
        for section in sections {
            XCTAssertTrue(app.staticTexts[section].waitForExistence(timeout: 1.5), "Section \(section) should be visible")
        }

        XCTAssertTrue(app.tables.staticTexts["Norvège"].exists)
        XCTAssertTrue(app.tables.staticTexts["Oslo"].exists)
    }

    func test_SelectingNorway_ShowsDetailScreen() throws {
        let app = XCUIApplication()
        app.launch()

        app.tables.staticTexts["Norvège"].tap()

        XCTAssertTrue(app.staticTexts["Norvège"].exists)
        XCTAssertTrue(app.staticTexts["Oslo"].exists)
        XCTAssertTrue(app.maps.firstMatch.exists)
    }

    func test_BackFromDetail_ReturnsToList() throws {
        let app = XCUIApplication()
        app.launch()

        app.tables.staticTexts["Norvège"].tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()

        XCTAssertTrue(app.tables.firstMatch.exists)
    }

    // MARK: - Detail Screen

    func test_DetailScreen_ShowsAllElements() throws {
        let app = XCUIApplication()
        app.launch()

        app.tables.staticTexts["Norvège"].tap()

        XCTAssertTrue(app.staticTexts["Norvège"].exists)
        XCTAssertTrue(app.staticTexts["Oslo"].exists)
        XCTAssertTrue(app.images.firstMatch.exists)
        XCTAssertTrue(app.maps.firstMatch.exists)
    }

    func test_OpenMap_FromDetail_ByTappingMiniMap() throws {
        let app = XCUIApplication()
        app.launch()

        app.tables.staticTexts["Norvège"].tap()

        app.tapAt(dx: 0.5, dy: 0.80)

        sleep(1)

        XCTAssertTrue(app.maps.firstMatch.exists, "Full map should be visible")
    }

    // MARK: - Map Screen

    func test_BackFromMap_ReturnsToDetailText() throws {
        let app = XCUIApplication()
        app.launch()

        app.tables.staticTexts["Norvège"].tap()

        let window = app.windows.element(boundBy: 0)
        let mapArea = window.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.80))
        mapArea.tap()
        sleep(1)

        let backArrowArea = window.coordinate(withNormalizedOffset: CGVector(dx: 0.06, dy: 0.07))
        backArrowArea.tap()
        sleep(1)

        // Verify the text view contains the expected text
        let descriptionView = app.textViews.firstMatch
        XCTAssertTrue(descriptionView.waitForExistence(timeout: 2))

        let descriptionText = descriptionView.value as? String ?? ""
        XCTAssertTrue(descriptionText.contains("La Norvège, officiellement le Royaume de Norvège"),
                      "La description du pays devrait être visible après le retour depuis la carte")
    }

    func test_Map_ShowsPinForCapital() throws {
        let app = XCUIApplication()
        app.launch()

        app.tables.staticTexts["Norvège"].tap()

        let window = app.windows.element(boundBy: 0)
        let mapArea = window.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.80))
        mapArea.tap()

        XCTAssertTrue(app.maps.firstMatch.waitForExistence(timeout: 3),
                      "The full map should be visible")

        // Check that a pin or label with the capital's name exists
        let osloElement = app.otherElements.containing(NSPredicate(format: "label CONTAINS[c] %@", "Oslo")).firstMatch
        XCTAssertTrue(osloElement.waitForExistence(timeout: 2),
                      "The map should show a pin or label for the capital 'Oslo'")
    }

    // MARK: - General Behavior

    func test_AppLaunch_Performance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}

// Reusable helpers
extension XCUIApplication {
    /// Tap using normalized coordinates (0..1) in the main window
    func tapAt(dx: CGFloat, dy: CGFloat) {
        let win = windows.element(boundBy: 0)
        let p = win.coordinate(withNormalizedOffset: CGVector(dx: dx, dy: dy))
        p.tap()
    }
}
