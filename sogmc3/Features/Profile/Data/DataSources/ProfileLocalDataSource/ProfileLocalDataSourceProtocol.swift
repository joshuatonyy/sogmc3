//
//  ProfileLocalDataSourceProtocol.swift
//  sogmc3
//
//  Created by Dimas on 23/06/23.
//

import Foundation

protocol ProfileLocalDataSourceProtocol {
    func savePublicAccessToken(_ accessToken: String) throws
    func saveUserAccessToken(_ accessToken: String, forBankID bankID: Int) throws
    func readPublicAccessToken() throws -> String
    func readUserAccessToken(for bankID: Int) throws -> String
}
