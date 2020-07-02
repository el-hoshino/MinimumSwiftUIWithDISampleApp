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
                NavigationLink(title: "Title", content: usecase.myName) {
                    NameSetupView(usecase: nameUsecase)
                }
                NavigationLink(title: "Age", content: "\(usecase.myAge)") {
                    BirthdaySetupView(usecase: birthdayUsecase)
                }
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    
    final class DummyDataUsecase: SummaryDataUsecaseProtocol {
        @State var myName = "Hello, World!"
        @State var myAge = 1
    }
    
    static let usecase = DummyDataUsecase()
    
    static var previews: some View {
        SummaryView(usecase: usecase)
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
