//
//  MountainProviderTest.swift
//  MountainChallengeTests
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import XCTest
import RxBlocking
@testable import MountainChallenge

class MountainProviderTest: XCTestCase {
    func testGetMountains() throws {
        // Given
        let provider: MountainProviderProtocol = MountainProvider.getMountains
        
        // When
        let result = try provider.getMountains().toBlocking().first()
        
        // Then
        XCTAssertEqual(result?.count, 50)
    }
}
