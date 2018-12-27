//
//  MountainRepositoryTest.swift
//  MountainChallengeTests
//
//  Created by Gustavo Miyamoto on 26/12/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import XCTest
import RxBlocking
@testable import MountainChallenge

class MountainRepositoryTest: XCTestCase {
    private var repository: MountainRepository?
    
    override func setUp() {
        repository = YamapProvider.mountainDataSource
    }
    
    // MARK: Get mountains unit test
    func testGetMountains() throws {
        // Given
        // ---
        
        // When
        let result = try repository?.getMountains().toBlocking().first()
        
        // Then
        XCTAssertEqual(result?.count, 50)
    }
    
    // MARK: Get mountain image unit test
    func testGetMountainImage() throws {
        // Given
        let url = "https://cdn.yamap.co.jp/public/image2.yamap.co.jp/production/26250373"
        
        // When
        let result = try repository?.getMountainImage(url: url).toBlocking().first()
        
        // Then
        XCTAssertNotEqual(result, nil)
    }
}
