//
//  ProfileUsecase.swift
//  iOS
//
//  Created by 史 翔新 on 2020/07/02.
//

import Foundation
import Combine

final class ProfileUsecase: ObservableObject {
    
    @Published var publishedName: String?
    @Published var publishedBirthday: Date?
    
    func ageOnYear(at date: Date) -> Int? {
        
        guard let birthday = publishedBirthday else {
            return nil
        }
        
        let years = Calendar.current.dateComponents([.year], from: birthday, to: date).year
        
        return years
        
    }
    
}

extension ProfileUsecase: SummaryDataUsecaseProtocol {
    
    var myName: String {
        publishedName ?? ""
    }
    
    var myAge: String {
        ageOnYear(at: Date()).map { "\($0)" } ?? ""
    }
    
}

extension ProfileUsecase: NameSetupUsecaseProtocol {
    
    var name: String {
        get {
            publishedName ?? ""
        }
        set {
            publishedName = newValue
        }
    }
    
    
}

extension ProfileUsecase: BirthdaySetupUsecaseProtocol {
    
    var birthday: Date {
        get {
            publishedBirthday ?? Date()
        }
        set {
            publishedBirthday = newValue
        }
    }
    
}
