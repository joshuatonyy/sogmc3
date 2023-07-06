//
//  TabBar2.swift
//  sogmc3
//
//  Created by Joshua on 23/06/23.
//

import SwiftUI


//MARK: DUMMY HOME VM
class MockHomeViewModel: ObservableObject {
    @Published var spend: Double = 203_000
    @Published var budget: Double = 400_000
    @Published var isNotificationExist: Bool = true
    @Published var spendRatio: Double = 0.0
    @Published var isShowDimmedView: Bool = true
}

struct TabBar2: View {
    @State var selectedMenu = 3
    
    let iconsPlaceholder = ["house.fill", "arrow.left.arrow.right", "chart.bar.xaxis"]
    let iconsname_placeholder = ["Dashboard", "Transaction", "Report"]
    @StateObject var homeVM = MockHomeViewModel()
    @StateObject var assessmentVM = MockAssessmentViewModel()
    @StateObject var subCategoryVM = MockSubCategoryViewModel()
    @StateObject var categoryVM = MockCategoryViewModel()
    @StateObject var categoryViewModel = CategoryViewModel()
    
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                switch selectedMenu {
                //MARK: Home View
                case 0:
                    ZStack {
                        HomeView(homeVM: homeVM, subCategoryVM: subCategoryVM)
                        
                        if homeVM.isShowDimmedView {
                            //MARK: Dimmed View
                           DimmedViewComponent(homeVM: homeVM)
                            
                            //MARK: Showing Information
                            WarningInformationComponent()
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        }
                    }
                    
                //MARK: TranscationView
                case 1:
                    NavigationView {
                       TransactionView()
                    }
                    
                //MARK: Report View
                case 2:
                    NavigationView {
                        VStack {
                            ReportView() //change to input menu
                        }
                    }
                    
                //MARK: Assessment Name View
                case 3:
                    AssessmentNameView(assessmentVM: assessmentVM,
                                       selectedMenu: $selectedMenu)
                    
                //MARK: Assessment Budget View
                case 4:
                    AssessmentBudgetView(assessmentVM: assessmentVM,
                                         selectedMenu: $selectedMenu)
                
                //MARK: Assessment SubCat View
                case 5:
                    AssessmentSubCatView(assessmentVM: assessmentVM,
                                         subCategoryVM: subCategoryVM,
                                         categoryVM: categoryVM,
                                         selectedMenu: $selectedMenu)
                
                //MARK: Assessment Loading View
                case 6:
                    AssessmentLoadingView(selectedMenu: $selectedMenu)
                
                //MARK: Assessment Result View
                case 7:
                    AssessmentResultView(assessmentVM: assessmentVM,
                                         subCategoryVM: subCategoryVM,
                                         selectedMenu: $selectedMenu)
                default:
                    Text("Default View")
                }
            }
            
            if selectedMenu >= 0 && selectedMenu < 3 {
                HStack{
                    
                    ForEach(0..<3, id: \.self) { number in
                        Spacer()
                        Button(action: {
                            self.selectedMenu = number
                        }, label: {
                            VStack{
                                Image(systemName: iconsPlaceholder[number])
                                    .resizable()
                                    .frame(width: 24, height: 21)
                                    .foregroundColor(selectedMenu == number ? .blue : Color(UIColor.lightGray))
                                Text(iconsname_placeholder[number])
                                    .font(.system(size: 10))
                                    .foregroundColor(selectedMenu == number ? .blue : Color(UIColor.lightGray))
                            }
                            .padding(.bottom, 15)
                        })
                        Spacer()
                    }
                }
                .frame(height: CGFloat(83))
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .ignoresSafeArea()
            }
        }
    }
}

struct TabBar2_Previews: PreviewProvider {
    static var previews: some View {
        TabBar2()
    }
}
