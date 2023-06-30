//
//  ConnectedAccountsCard.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
//

import SwiftUI

struct ConnectedAccountsCard: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 358, height: 170)
                .foregroundColor(Color.CardColor.main)
            VStack{
                HStack{
                    Text("Connected Accounts")
                        .frame(alignment: .topTrailing)
                        .padding(.bottom, 10)
                        .foregroundColor(Color.Neutral.s20)

                    Spacer()
                }
                                
                HStack{
                    Text("Bank")
                        .font(.caption
                            .weight(.medium))
                        .foregroundColor(Color.Neutral.s10)
                    Spacer()
                }
                ConnectedBankSections(connectedBankVM: ConnectedBankViewModel())
                    .padding(.bottom, 15)
                
                HStack{
                    Text("E-Wallet")
                        .font(.caption
                            .weight(.medium))
                        .foregroundColor(Color.Neutral.s10)

                    Text("Coming Soon")
                        .font(.system(size: 8))
                        .padding(2)
                        .foregroundColor(Color.Neutral.s10)
                        .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.Neutral.s90))
                    Spacer()
                }
            }
            .frame(width: 326)
//            .frame(width: 326, height: 132)

        }
    }
}

struct ConnectedAccountsCard_Previews: PreviewProvider {
    static var previews: some View {
        ConnectedAccountsCard()
    }
}

