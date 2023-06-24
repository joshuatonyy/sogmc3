//
//  ConnectedAccountsCard.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 24/06/23.
//

import SwiftUI

// TODO: change all font color
struct ConnectedAccountsCard: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
            // TODO: change foreground color to system
                .foregroundColor(.gray)
                .frame(width: 358, height: 170)
            VStack{
                HStack{
                    Text("Connected Accounts")
                        .frame(alignment: .topTrailing)
                        .padding(.bottom, 10)
                    Spacer()
                }
                                
                HStack{
                    Text("Bank")
                        .font(.caption
                            .weight(.medium))
                    Spacer()
                }
                ConnectedBankSections(connectedBankVM: ConnectedBankViewModel())
                    .padding(.bottom, 15)
                
                HStack{
                    Text("E-Wallet")
                        .font(.caption
                            .weight(.medium))
                    Text("Coming Soon")
                        .font(.system(size: 8))
                        .padding(2)
                        .background(
                        RoundedRectangle(cornerRadius: 4)
                        
                        //TODO: change fill color to system
                            .fill(.white))
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
