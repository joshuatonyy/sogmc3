//
//  CoreDataViewModel.swift
//  sogmc3
//
//  Created by Geraldy Kumara on 22/06/23.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    @Published var user: [UserEntity] = []
    @Published var method: [BudgetMethodEntity] = []
    @Published var category: [CategoryEntity] = []
    @Published var subCategory: [SubCategoryEntity] = []
    @Published var transaction: [TransactionEntity] = []
    @Published var transactionType: [TransactionTypeEntity] = []
    @Published var walletType: [EWalletEntity] = []
    
    init(){
        getSubCategory()
        getUser()
        getCategory()
        getTransaction()
        getSubCategory()
        getBudgetMethod()
        getTransactionType()
        getEWallet()
    }
    
   // MARK: ADD ENTITY
    //User
    func addUser(username: String, income: Int64){
        let user = UserEntity(context: manager.context)
        user.username = username
        user.userIncome = income
        user.userID = UUID()
        save()
    }
    
    func getUser(){
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        do{
            user = try manager.context.fetch(request)
        } catch let error {
            print("Error Get Data User. \(error.localizedDescription)")
        }
    }
    
    // Budget Method
    func addBudgetMethod(budgetMethod: String){
        let budget = BudgetMethodEntity(context: manager.context)
        budget.budgetMethodName = budgetMethod
        
        save()
    }
    
    func getBudgetMethod(){
        let request = NSFetchRequest<BudgetMethodEntity>(entityName: "BudgetMethodEntity")
        do{
            method = try manager.context.fetch(request)
        } catch let error {
            print("Error Get Budget Method. \(error.localizedDescription)")
        }
        if method.isEmpty{
            addBudgetMethod(budgetMethod: "50 30 20")
        }
    }
    
    // Category
    func addCategory(categoryName: String, categoryPercentage: Int64){
        let category = CategoryEntity(context: manager.context)
        category.categoryName = categoryName
        category.categoryPercentage = categoryPercentage
        save()
    }
    
    func getCategory(){
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        do{
            category = try manager.context.fetch(request)
        } catch let error {
            print("ERROR Get Data Category. \(error.localizedDescription)")
        }
        if category.isEmpty{
            addCategory(categoryName: "Needs", categoryPercentage: 50)
            addCategory(categoryName: "Wants", categoryPercentage: 30)
            addCategory(categoryName: "Other", categoryPercentage: 20)
        }
    }
    
    // SubCategory
    func addSubCategory(subCategoryName: String, subCategoryIcon: String){
        let subCategory = SubCategoryEntity(context: manager.context)
        subCategory.subCategoryName = subCategoryName
        subCategory.subCategoryIcon = subCategoryIcon
        save()
    }
    
    func getSubCategory(){
        let request = NSFetchRequest<SubCategoryEntity>(entityName: "SubCategoryEntity")
        do{
            subCategory = try manager.context.fetch(request)
        } catch let error {
            print("Error Get Data SubCategory. \(error.localizedDescription)")
        }
        if subCategory.isEmpty{
            addSubCategory(subCategoryName: "Saving", subCategoryIcon: "💸")
            addSubCategory(subCategoryName: "Food & Beverage", subCategoryIcon: "🍛")
            addSubCategory(subCategoryName: "Transportation", subCategoryIcon: "🚗")
            addSubCategory(subCategoryName: "Utilities", subCategoryIcon: "🔋")
            addSubCategory(subCategoryName: "Family", subCategoryIcon: "👨‍👩‍👧‍👦")
            addSubCategory(subCategoryName: "Entertainent", subCategoryIcon: "🎬")
            addSubCategory(subCategoryName: "Travel", subCategoryIcon: "🛫")
            addSubCategory(subCategoryName: "Membership", subCategoryIcon: "💳")
            addSubCategory(subCategoryName: "Shopping", subCategoryIcon: "🛍️")
            addSubCategory(subCategoryName: "Transaction", subCategoryIcon: "🔻🔺")
            addSubCategory(subCategoryName: "Housing", subCategoryIcon: "🏠")
            addSubCategory(subCategoryName: "Personal Care", subCategoryIcon: "🧴")
            addSubCategory(subCategoryName: "Insurance", subCategoryIcon: "🛡️")
            addSubCategory(subCategoryName: "Groceries", subCategoryIcon: "🛒")
            addSubCategory(subCategoryName: "Internet", subCategoryIcon: "🌐")
            addSubCategory(subCategoryName: "Education", subCategoryIcon: "📚")
            addSubCategory(subCategoryName: "Basic Clothing", subCategoryIcon: "👕")
            addSubCategory(subCategoryName: "Dining Out", subCategoryIcon: "🍽️")
            addSubCategory(subCategoryName: "Electronics", subCategoryIcon: "💻")
            addSubCategory(subCategoryName: "Home Decor and Furnishing", subCategoryIcon: "🏞️")
            addSubCategory(subCategoryName: "Emergency Fund", subCategoryIcon: "⚠️")
            addSubCategory(subCategoryName: "Investment", subCategoryIcon: "💰")
            addSubCategory(subCategoryName: "Special Event", subCategoryIcon: "🎉")
        }
    }
    
    // Transaction
    func addTransaction(transactionName: String, transactionAmount: Int64){
        let trans = TransactionEntity(context: manager.context)
        trans.transactionaName = transactionName
        trans.transactionDate = Date()
        trans.transactionAmount = transactionAmount
        save()
    }
    
    func getTransaction(){
        let request = NSFetchRequest<TransactionEntity>(entityName: "TransactionEntity")
        do{
            transaction = try manager.context.fetch(request)
        } catch let error {
            print("Error Get Transaction Data. \(error.localizedDescription)")
        }
    }
    
    //TransactionType
    func addTransactionType(type: String){
        let transactionType = TransactionTypeEntity(context: manager.context)
        transactionType.transactionTypeName = type
        save()
    }
    
    func getTransactionType(){
        let request = NSFetchRequest<TransactionTypeEntity>(entityName: "TransactionTypeEntity")
        do{
            transactionType = try manager.context.fetch(request)
        } catch let error {
            print("Error Get Transaction Type. \(error.localizedDescription)")
        }
        if transactionType.isEmpty{
            addTransactionType(type: "Expense")
            addTransactionType(type: "Income")
        }
    }
    
    //E-Wallet Type
    func addEWallet(wallets: String){
        let wallet = EWalletEntity(context: manager.context)
        wallet.walletTypeName = wallets
        save()
    }
    
    func getEWallet(){
        let request = NSFetchRequest<EWalletEntity>(entityName: "EWalletEntity")
        do{
            walletType = try manager.context.fetch(request)
        } catch let error {
            print("Error Get Wallet Data. \(error.localizedDescription)")
        }
        if walletType.isEmpty{
            addEWallet(wallets: "BCA")
            addEWallet(wallets: "BNI")
            addEWallet(wallets: "Mandiri")
            addEWallet(wallets: "OVO")
            addEWallet(wallets: "Gopay")
        }
    }
    
    func save(){
        manager.saveData()
    }
}
