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
    @State private var showModalIncome = false
    @State private var showModalReminder = false
    
    var body: some View {
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
            
            Button (action: {
                // Button action code
                print("Button tapped")
                showModalIncome = true
            }) {
                HStack{
                    ZStack{
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color.CardColor.main)
                        
                        Image(systemName: "dollarsign.circle")
                            .foregroundColor(Color.Neutral.s40)
                            .symbolRenderingMode(.monochrome)
                    }
                    Text("Edit income")
                        .foregroundColor(Color.Neutral.s40)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 15)
            }
            .sheet(isPresented: $showModalIncome) {
                EditIncomeSheetView()
            }

            
            Button (action: {
                // Button action code
                print("Button tapped")
                showModalIncome = true

            }){
                HStack{
                    ZStack{
                        Circle()
                            .foregroundColor(Color.CardColor.main)
                            .frame(width: 32, height: 32)
                        Image(systemName: "bell.fill")
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(Color.Neutral.s40)
                    }
                    Text("Set reminder")
                        .foregroundColor(Color.Neutral.s40)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.leading, 15)
            }
            .sheet(isPresented: $showModalReminder) {
                SetReminderView()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.Background.main)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
