//
//  LoginViewModel.swift
//  BottomSheet
//
//  Created by Акнур on 02.08.2021.
//

import SwiftUI


class LoginViewModel: ObservableObject {
    
    @Published var storedUsername = "Aknur"
    @Published var  storedpassword = "abcabc"
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var authenticationDidFail: Bool = false
    @Published var authenticationDidSucceed: Bool = false
    @Published var month: String = ""
    @Published var year: String = ""
    @Published var cv: String = ""
    
}
