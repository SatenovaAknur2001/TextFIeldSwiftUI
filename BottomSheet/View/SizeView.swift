//
//  SizeView.swift
//  BottomSheet
//
//  Created by Акнур on 02.08.2021.
//


import SwiftUI

struct SizeView: View {
    @ObservedObject var login = LoginViewModel()
    var body: some View {
       

        VStack(alignment: .center, spacing: 30){
        HStack(spacing: 200){
            Text("Общая площадь")
                .font(.system(size: 20))
                .fontWeight(.bold)
//                .font(.custom("SFPRODISPLAYBOLD", size: 20))
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            
            Button(action: {
                
            }){
                Image("discard")
                    .frame(width: 24, height: 24)
            }
                
        }
            
            
            
            //MARK: -Textfield
            VStack(alignment: .leading, spacing: 5){
            SizeTextField(username: $login.username)
               .keyboardType(.numbersAndPunctuation)
                PreSizeTextField(username: $login.username)
            
            }
            HStack(spacing: 230){
            Button(action: {
                
            }){
               
                Text("Сбросить")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
              
            
            }
            Button(action: {
                
            }){
                Text("Cохранить")
                    .font(.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1)))
            }
        }
    }
        
    }
}

struct SizeView_Previews: PreviewProvider {
    static var previews: some View {
        SizeView()
    }
}

struct SizeTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 5) {
            Text("    От")
                .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
                .font(.system(size: 14))
                .multilineTextAlignment(.trailing)
        TextField("м²", text: $username)
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

struct PreSizeTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
        Text("   До")
            .foregroundColor(Color(#colorLiteral(red: 0.2274509804, green: 0.2274509804, blue: 0.2470588235, alpha: 1)))
            .font(.system(size: 14))
        TextField("м²", text: $username)
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
