//
//  BinancePublicKey.swift
//  WalletBase
//
//  Created by Can Dang on 7/9/19.
//  Copyright © 2019 Can Dang. All rights reserved.
//

import Foundation
public final class BinancePublicKey: PublicKey {
    /// Validates that raw data is a valid public key.
    static public func isValid(data: Data) -> Bool {
        if data.count != 65 {
            return false
        }
        return true
    }
    
    /// Coin this key is for.
    public let coin = Coin.bitcoin
    
    /// Raw representation of the public key.
    public let data: Data
    
    /// Address.
    public var address: Address {
        let hash = Data([Bitcoin.MainNet.publicKeyHashAddressPrefix]) + Crypto.sha256ripemd160(data)
        return BitcoinAddress(data: hash)!
    }
    
    /// Creates a public key from a raw representation.
    public init?(data: Data) {
        if !BitcoinPublicKey.isValid(data: data) {
            return nil
        }
        self.data = data
    }
    
    public var description: String {
        return address.description
    }
}
