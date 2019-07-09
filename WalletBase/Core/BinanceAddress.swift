//
//  BinanceAddress.swift
//  WalletBase
//
//  Created by Can Dang on 7/9/19.
//  Copyright © 2019 Can Dang. All rights reserved.
//
import Foundation

public struct BinanceAddress: Address, Hashable {

    
    /// Validates that the raw data is a valid address.
    static public func isValid(data: Data) -> Bool {
 
        return true
    }
    
    /// Validates that the string is a valid address.
    static public func isValid(string: String) -> Bool {
    
        return true
    }
    
    /// Coin this address is for.
    public let coin = Coin.binance
    
    /// Raw representation of the address.
    public let data: Data
    
    /// Creates an address from a raw representation.
    public init?(data: Data) {
        if !BinanceAddress.isValid(data: data) {
            return nil
        }
        self.data = data
    }
    
    /// Creates an address from a string representation.
    public init?(string: String) {
        guard let decoded = Crypto.base58Decode(string, expectedSize: Bitcoin.addressSize + 1) else {
            return nil
        }
        self.init(data: decoded)
    }
    
    public var description: String {
        return Crypto.sha256ripemd160(data).hexString
//        return Crypto.base58Encode(data)
    }
    
    public var hashValue: Int {
        return data.hashValue
    }
    
    public static func == (lhs: BinanceAddress, rhs: BinanceAddress) -> Bool {
        return lhs.data == rhs.data
    }

}
