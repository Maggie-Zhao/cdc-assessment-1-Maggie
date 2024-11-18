//
//  CryptoViewModel.swift
//  cdc-assessment-1-Maggie
//
//  Created by 赵明慧 on 2024/11/16.
//

import Foundation

protocol CryptoViewModelProtocol {
    var cryptoList: CryptoModel? { get }
    func getCryptoList()
}
 
class CryptoViewModel: CryptoViewModelProtocol {
    var cryptoList: CryptoModel?
    
    init(cryptoList: CryptoModel) {
        self.cryptoList = cryptoList
    }
    
    func getCryptoList() {
        guard let path = Bundle.main.path(forResource: "crypto_list", ofType: "json") else { return }
        print(path)
        let url = URL(fileURLWithPath: path)
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let jsonObjects = try decoder.decode(CryptoModel.self, from: data)
            let listData: [CryptoDetail] = jsonObjects.data ?? []
            self.cryptoList?.data = listData
        } catch {
            print("Error loading JSON: \(error)")
        }
    }
}
