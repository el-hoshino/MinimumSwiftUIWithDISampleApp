//
//  SummaryView.swift
//  iOS
//
//  Created by 史 翔新 on 2020/07/03.
//

import SwiftUI

protocol SummaryDataUsecaseProtocol: ObservableObject {
    var myName: String { get }
    var myAge: Int { get }
}

struct SummaryView<
    Usecase: SummaryDataUsecaseProtocol,
    NameUsecase: NameSetupUsecaseProtocol,
    BirthdayUsecase: BirthdaySetupUsecaseProtocol>: View {
    
    @ObservedObject var usecase: Usecase
    
    let nameUsecase: NameUsecase
    let birthdayUsecase: BirthdayUsecase
        
    var body: some View {
        NavigationView {
            List {
                NavigationLink(title: "Name", content: usecase.myName) {
                    NameSetupView(usecase: nameUsecase)
                }
                NavigationLink(title: "Age", content: "\(usecase.myAge)") {
                    BirthdaySetupView(usecase: birthdayUsecase)
                }
            }
            .navigationTitle("My Profile")
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    
    final class DummyDataUsecase: SummaryDataUsecaseProtocol,
                                  NameSetupUsecaseProtocol,
                                  BirthdaySetupUsecaseProtocol {
        @State var myName = "Hello, World!"
        @State var myAge = 1
        var name: String {
            set { myName = newValue }
            get { myName }
        }
        var birthday: Date {
            set { print("\(newValue)") }
            get { Date() }
        }
    }
    
    static let usecase = DummyDataUsecase()
    
    static var previews: some View {
        SummaryView(usecase: usecase,
                    nameUsecase: usecase,
                    birthdayUsecase: usecase)
    }
}

private extension NavigationLink {
    
    init(title: String, content: String, destination: () -> Destination) where Label == SummaryCell {
        self = NavigationLink(
            destination: destination(),
            label: {
                SummaryCell(title: title, content: content)
            })
    }
    
}
