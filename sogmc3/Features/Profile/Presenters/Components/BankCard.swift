//
//  BankCard.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
//

import SwiftUI
import Foundation

struct BankCard: View {
    var bank: EWallet
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 44,height: 44)
            
                // TODO: change foreground color to system
                .foregroundColor(Color(.gray))
            Image("\(bank.walletName)Logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 40, maxHeight: 40)
        }
    }
}

struct BankCard_Previews: PreviewProvider {
    static var previews: some View {
        BankCard(bank: EWallet(walletName: "Mandiri"))
    }
}
