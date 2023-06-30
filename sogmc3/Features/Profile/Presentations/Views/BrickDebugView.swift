////
////  BrickDebugView.swift.swift
////  sogmc3
////
////  Created by Dimas on 23/06/23.
////
//
//import SwiftUI
//import CoreData
//
//struct BrickDebugView: View {
//    
//    @State private var publicAccessToken: String?
//    
//    @State private var showLoadingIndicator = false
//    
//    @State private var showBrickWidget = false
//    
//    @Environment(\.managedObjectContext) var context
//    
//    private let profileRepository = ProfileRepository()
//    
//    var body: some View {
//        VStack(spacing: 32) {
//            
//            if showLoadingIndicator {
//                ProgressView()
//            }
//            
//            Text("Debug:")
//            
//            Button {
//                Task {
//                    showLoadingIndicator = true
//                    try? await profileRepository.fetchPublicAcessToken()
//                    showLoadingIndicator = false
//                }
//            } label: {
//                Text("Fetch public access token from network")
//            }
//            
//            Button {
//                Task {
//                    publicAccessToken = try? profileRepository.readPublicAccessToken()
//                    showBrickWidget = true
//                }
//            } label: {
//                Text("Read public access token from keychain")
//            }
//            
//            Button {
//                Task {
//                    let result = await profileRepository.profileRemoteDataSource.getAllUserTokens(for: "123")
//                    switch result {
//                    case .success(let success):
//                        print(success)
//                        try! profileRepository.profileLocalDataSource.saveAccessTokens(success)
//                    case .failure(let failure):
//                        print(failure)
//                    }
//                }
//            } label: {
//                Text("Get user access tokens")
//            }
//            
//            Button {
//                Task {
//                    let result = try! profileRepository.profileLocalDataSource.readAccessToken()
//                    print("result:")
//                    dump(result)
//                }
//            } label: {
//                Text("Fetch user access tokens from core data")
//            }
//            
//            Button {
//                Task {
//                    let result = try! await profileRepository.fetchUserAccessToken(for: "123")
//                    print("result:")
//                    dump(result)
//                }
//            } label: {
//                Text("Fetch and save user access tokens")
//            }
//            
//            Button {
//                let result = try! profileRepository.readAccessTokens()
//                print("result:")
//                dump(result)
//            } label: {
//                Text("Read user access tokens")
//            }
//            
//            Button {
//                Task {
//                    do {
//                        let transactions = try await TransactionRepository().fetchTransactions()
//                        
//                        for transaction in transactions {
//                            
//                            let request: NSFetchRequest<TransactionEntity> = TransactionEntity.fetchRequest()
//                            request.predicate = NSPredicate(format: "referenceID = %@", argumentArray: [transaction.referenceId])
//                            
//                            if let object = try context.fetch(request).first {
//                                // if a transaction with a given reference id is already exist, continue
//                                continue
//                            }
//                            
//                            let dateFormatter = DateFormatter()
//                            dateFormatter.dateFormat = "yyyy-MM-dd"
//
//                            guard let date = dateFormatter.date(from: transaction.date) else {
//                                print("error while creating date from string: \(transaction.date)")
//                                continue
//                            }
//                            
//                            let newTransactionEntity = TransactionEntity(context: context)
//                            newTransactionEntity.referenceID = transaction.referenceId
//                            newTransactionEntity.transactionAmount = Int64(transaction.amount)
//                            newTransactionEntity.transactionDate = date
//                            newTransactionEntity.transactionaName = transaction.description
//                            
//                            let newSubcatory = SubCategoryEntity(context: context)
//                            newSubcatory.subCategoryName = transaction.category.categoryName.capitalized
//                            newTransactionEntity.subcategories = newSubcatory
//                            
//                            try context.save()
//                        }
//                        
//                    } catch {
//                        print("error:", error )
//                    }
//                }
//            } label: {
//                Text("Fetch transactions")
//            }
//            
//            Button {
//                let request: NSFetchRequest<TransactionEntity> = TransactionEntity.fetchRequest()
//                let result = try! context.fetch(request)
//                for r in result {
//                    print(r.referenceID, r.transactionaName, r.subcategories?.subCategoryName)
//                }
//            } label: {
//                Text("Fetch transactions from core data")
//            }
//            
////            Text("public accessToken: \(publicAccessToken ?? "empty")")
//            
//        }
////        .sheet(isPresented: $showBrickWidget, onDismiss: {
////            print("sheet is dismissed")
////            Task {
////                do {
////                    try await profileRepository.fetchUserAccessToken(for: "mock-user-1")
////                } catch {
////                    print("error:", error)
////                }
////            }
////        }) {
////            if let publicAccessToken {
////                WebView(publicAccessToken: publicAccessToken, userID: "mock-user-1")
////            }
////        }
//    }
//}
//
//
//struct BrickDebugView_Previews: PreviewProvider {
//    static var previews: some View {
//        BrickDebugView()
//    }
//}
