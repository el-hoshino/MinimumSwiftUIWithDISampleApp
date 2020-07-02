//
//  MyProfileApp.swift
//  Shared
//
//  Created by 史 翔新 on 2020/07/02.
//

import SwiftUI

@main
struct MyProfileApp: App {
    
    @StateObject private var profileUsecase = ProfileUsecase()
    
    var body: some Scene {
        WindowGroup {
            SummaryView(usecase: profileUsecase,
                        nameUsecase: profileUsecase,
                        birthdayUsecase: profileUsecase)
        }
    }
}
