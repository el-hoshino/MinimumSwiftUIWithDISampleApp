//
//  NameSetupView.swift
//  iOS
//
//  Created by 史 翔新 on 2020/07/03.
//

import SwiftUI

protocol NameSetupUsecaseProtocol: ObservableObject {
    var name: String { get set }
}

struct NameSetupView<Usecase: NameSetupUsecaseProtocol>: View {
    
    @ObservedObject var usecase: Usecase
    
    var body: some View {
        TextField("Insert your name here", text: $usecase.name)
            .navigationTitle("Edit Name:")
    }
}

struct NameSetupView_Previews: PreviewProvider {
    
    final class Usecase: NameSetupUsecaseProtocol {
        @State var name: String
        init(name: String) {
            self.name = name
        }
    }
    
    static var previews: some View {
        Group {
            NameSetupView(usecase: Usecase(name: ""))
            NameSetupView(usecase: Usecase(name: "Your Name."))
        }
        .previewLayout(.sizeThatFits)
    }
}
