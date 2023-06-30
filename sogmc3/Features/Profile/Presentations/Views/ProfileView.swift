//
//  ProfileView.swift
//  sogmc3
//
//  Created by Jihan Alfiyyah Munajat on 25/06/23.
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
        NavigationView{
            VStack{
                HStack{
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 56))
                        .foregroundColor(Color.Neutral.s40)
                        .symbolRenderingMode(.monochrome)

                    Text("\(profileVM.username)")
                        .fontWeight(.semibold)
                        .font(.system(size: 17))
                        .foregroundColor(Color.Neutral.s10)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 10)
                
                
                ConnectedAccountsCard()
                    .padding(.top, 10)
                
                NavigationLink(destination: EditIncomeSheetView()) {
                   EditIncomeSection()
                }
                
                NavigationLink(destination: SetReminderView()) {
                    SetReminderSection()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.Background.main)
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
