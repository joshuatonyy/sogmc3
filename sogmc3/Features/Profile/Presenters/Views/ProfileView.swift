//
//  ProfileView.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 22/06/23.
//

import SwiftUI

/* Data yang dibutuhin:
 - Nama
 - Income
 - Connected Bank Accounts
 
 */

// MARK: Dummy Profile VM
class ProfileViewModel: ObservableObject {
    @Published var username: String = "Jihan Gabriella Putu"
    @Published var userIncome: Int = 10_000_000
    @Published var connectedBanks: [String] = ["BCA", "BNI", "Mandiri", "OVO", "Gopay"]
    @Published var connectedWallet: [String] = ["OVO", "Gopay"]
}


// TODO: change all font color
struct ProfileView: View {
    @StateObject var profileVM = ProfileViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 56))
                Text("\(profileVM.username)")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 10)
            
            
            ConnectedAccountsCard()
                .padding(.top, 10)
            
            HStack{
                ZStack{
                    Circle()
                        .fill(.gray)
                        .frame(width: 32, height: 32)
                    Image(systemName: "dollarsign.circle")
                }
                Text("Edit income")
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 15)

            
            HStack{
                ZStack{
                    Circle()
                        .fill(.gray)
                        .frame(width: 32, height: 32)
                    Image(systemName: "bell.fill")
                }
                Text("Set reminder")
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 15)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        // TODO: add background main color
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
