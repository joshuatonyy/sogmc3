//
//  ConnectedBankSections.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 24/06/23.
//

import SwiftUI

// MARK: Dummy entity Card
class EWallet: Identifiable {
    var walletID = UUID()
    var walletName: String = ""
    
    init(walletID: UUID = UUID(), walletName: String){
        self.walletName = walletName
    }
}

class ConnectedBankViewModel: ObservableObject {
    @Published var connectedWallet: [EWallet] = [
        EWallet(walletName: "BNI"),
        EWallet(walletName: "BCA"),
        EWallet(walletName: "Mandiri")
    ]
}



struct ConnectedBankSections: View {
    @ObservedObject var connectedBankVM: ConnectedBankViewModel
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(connectedBankVM.connectedWallet, id: \.walletID) { bank in
                    BankCard(bank: bank)
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 44,height: 44)
                    
                        // TODO: change foreground color to system
                        .foregroundColor(Color(.gray))
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 11, height: 16)
                }

            }
        }
    }
}

struct ConnectedBankSections_Previews: PreviewProvider {
    static var previews: some View {
        ConnectedBankSections(connectedBankVM: ConnectedBankViewModel())
    }
}
