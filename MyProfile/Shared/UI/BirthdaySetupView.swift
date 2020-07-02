//
//  BirthdaySetupView.swift
//  iOS
//
//  Created by 史 翔新 on 2020/07/03.
//

import SwiftUI

protocol BirthdaySetupUsecaseProtocol: ObservableObject {
    var birthday: Date { get set }
}

struct BirthdaySetupView<Usecase: BirthdaySetupUsecaseProtocol>: View {
    
    @ObservedObject var usecase: Usecase
    
    var body: some View {
        DatePicker("Input your birthday", selection: $usecase.birthday, displayedComponents: .date)
    }
}

struct BirthdaySetupView_Previews: PreviewProvider {
    
    final class Usecase: BirthdaySetupUsecaseProtocol {
        @State var birthday: Date
        init(birthday: Date) {
            self.birthday = birthday
        }
    }
    
    static var birthday = Date()
    
    static var previews: some View {
        BirthdaySetupView(usecase: Usecase(birthday: birthday))
            .previewLayout(.sizeThatFits)
    }
}
