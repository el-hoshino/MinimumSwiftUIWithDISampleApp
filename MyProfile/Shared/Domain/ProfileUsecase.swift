//
//  ProfileUsecase.swift
//  iOS
//
//  Created by 史 翔新 on 2020/07/02.
//

import Foundation
import Combine

final class ProfileUsecase: ObservableObject {
    
    @Published var name: String?
    @Published var birthday: Date?
    
}
