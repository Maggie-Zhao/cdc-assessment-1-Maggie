//
//  cdc_assessment_1_MaggieTests.swift
//  cdc-assessment-1-MaggieTests
//
//  Created by 赵明慧 on 2024/11/16.
//

import Testing
import XCTest
@testable import cdc_assessment_1_Maggie

struct cdc_assessment_1_MaggieTests {

    @Test func testGetCryptoList() async throws {
        let viewModel = CryptoViewModel(cryptoList: CryptoModel())
        viewModel.getCryptoList()
        XCTAssertEqual(viewModel.cryptoList?.data?.count, 9)
    }

}
