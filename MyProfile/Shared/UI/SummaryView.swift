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

struct SummaryView<Usecase: SummaryDataUsecaseProtocol>: View {
    
    @ObservedObject var usecase: Usecase
    
    var body: some View {
        List {
            HStack {
                Text("Name:")
                Spacer()
                Text("\(usecase.myName)")
                    .font(.subheadline)
            }
            HStack {
                Text("Age:")
                Spacer()
                Text("\(usecase.myAge)")
                    .font(.subheadline)
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
