//
//  KeychainError.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation

enum KeychainError: Error {
    case encodingFailed, decodingFailed, dataNotAvailable, unknown(status: Int)
}
