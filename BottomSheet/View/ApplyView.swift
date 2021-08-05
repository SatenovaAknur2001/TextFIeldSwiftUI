//
//  ApplyView.swift
//  BottomSheet
//
//  Created by Акнур on 02.08.2021.
//


import SwiftUI

struct ApplyView: View {
    @ObservedObject var login = LoginViewModel()
    var body: some View {
       

        VStack(alignment: .leading, spacing: 30){
        HStack(spacing: 230){
            Text("Подать заявку")
                .font(.system(size: 20))
                .fontWeight(.bold)
//                .font(.custom("SFPRODISPLAYBOLD", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            
            
        }
            
            
            
            //MARK: -Textfield
            VStack(alignment: .leading, spacing: 5){
                PhoneNumberTextField(username: $login.username)
               .keyboardType(.numbersAndPunctuation)
                DocumentTextField(username: $login.username)
            
            }
            HStack(spacing: 200){
            Button(action: {
                
            }){
               
                Text("Сбросить")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
              
            
            }
            Button(action: {
                
            }){
                Text("Подать заявку")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
            }
        }
    }
        
    }
}

struct ApplyView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyView()
    }
}

struct PhoneNumberTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 5) {
            Text("     Номер телефона")
                .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
                .font(.system(size: 14))
                .multilineTextAlignment(.trailing)
        TextField("Введите номер телефона", text: $username)
//        TextField(image: "done", "", text: $username)
            .padding()
//            .frame(width: 340, height: 48)
            .frame(width: 383, height: 48)
            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(16.0)
            .padding(.bottom, 20)
        }
    }
}

struct DocumentTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
        Text("     ИИН")
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            .font(.system(size: 14))
        TextField("Введите ИИН", text: $username)
//        TextField(image: "done", "", text: $username)
            .padding()
//            .frame(width: 340, height: 48)
            .frame(width: 383, height: 48)
            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(16.0)
            .padding(.bottom, 20)
        }
    }
}
