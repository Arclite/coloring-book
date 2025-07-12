//  Created by Geoff Pado on 5/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Synchronization
import XCTest

import TelemetryClient

@testable import ICBLogging

final class TelemetryLoggerTests: XCTestCase {
    func testBareInitInitializesTelemetryManager() {
        XCTAssertFalse(TelemetryManager.isInitialized)

        _ = TelemetryLogger()

        XCTAssertTrue(TelemetryManager.isInitialized)
    }

    func testLogSendsEventNameAndInfo() throws {
        let spy = SpySender()
        let logger = TelemetryLogger(manager: spy)

        logger.log(Event(name: "test", info: ["key": "value"]))

        let spyName = try XCTUnwrap(spy.name)
        let spyInfo = try XCTUnwrap(spy.info)
        XCTAssertEqual(spyName, "test")
        XCTAssertEqual(spyInfo, ["key": "value"])
    }
}

private final class SpySender: TelemetrySending {
    let _name: Mutex<String?> = Mutex(nil)
    var name: String? {
        get { _name.withLock { $0 } }
        set { _name.withLock { $0 = newValue } }
    }
    let _info: Mutex<[String: String]?> = Mutex(nil)
    var info: [String: String]? {
        get { _info.withLock { $0 } }
        set { _info.withLock { $0 = newValue } }
    }

    func send(
        _ signalName: String,
        for clientUser: String?,
        floatValue: Double?,
        with additionalPayload: [String: String]
    ) {
        name = signalName
        info = additionalPayload
    }
}
