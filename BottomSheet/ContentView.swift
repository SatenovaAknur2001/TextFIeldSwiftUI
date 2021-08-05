//
//  ContentView.swift
//  BottomSheet
//
//  Created by Акнур on 01.08.2021.
//

import SwiftUI

let colorT = Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1))
let colorTextt = Color(#colorLiteral(red: 0.662745098, green: 0.6745098039, blue: 0.6901960784, alpha: 1))
struct ContentView: View {
  
    @State var cardNumber = ""
    @State var offset = CGSize.zero
    @State var showView = false
    @State var index = 0
    @ObservedObject var login = LoginViewModel()
    let buttons = [
        
            "1", "2", "3", "4",
            "5", "6", "7", "8",
            "9","0"

    ]
    var keyboard: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
            ForEach(buttons, id: \.self) { item in
                Button(action: {
                    
                    cardNumber += "\(item)"
                }) {
                    Text("\(item)")
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.white))
                }
            }
        }
        .foregroundColor(Color.black)
    }
    
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation(.spring()) {
                    showView.toggle()
                }
            }){
                Text("Показать")
                
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Capsule()
                    .fill(Color.white)
                    .frame(width: 50, height: 6)
                    .offset(y: -30)
                Text("Редактирование карты")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                VStack(spacing: -10){
                        VStack {

                            UsernameTextField(username: $login.username)
                               .keyboardType(.numbersAndPunctuation)
        
                            HStack(spacing: 20){
                           MonthTextField(month: $login.month)
                               .keyboardType(.decimalPad)
                           YearTextField(year: $login.year)
                               
                               CVTextField(cv: $login.cv)
                            }

                        }
                        .padding()

                .foregroundColor(colorText)
                HStack{
                    Button("Отмена"){
                        withAnimation(.spring()) {
                            showView.toggle()
                        }
                    }
                    Spacer()
                    Button("Готово"){
                        withAnimation(.spring()) {
                            showView.toggle()
                        }
                    }
                }
                
            }
                keyboard
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.white))
            //            .shadow(radius: 10)
            .padding()
            .offset(y: showView ? 0 : 1000)
            .offset(offset)
            .gesture(
                
                DragGesture()
                    .onChanged { value in
                        offset.height = value.translation.height
                    }
                    .onEnded { _ in
                        if offset.height > 100 {
                            showView = false
                        }
                        offset = .zero }
            )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardInfo: View {
    var text: String
    var body: some View {
        Text(text)
            .frame(height: 60)

            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 12.0).fill(colorTint))
            .foregroundColor(colorText)
    }
}


struct UsernameTextField: View {
    
    @Binding var username: String
//    @StateObject var color = UIColors()
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 5){
            Text("Номер карты")
                .foregroundColor(.black)
        TextField("_ _ _  _ _ _   _ _ _ _   _ _ _", text: $username)
//        TextField(image: "done", "", text: $username)
            .padding()
//            .frame(width: 340, height: 48)
            .frame(width: .infinity, height: 58)
            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(12.0)
            .padding(.bottom, 20)
        }
    }
}

struct MonthTextField: View {
    
    @Binding var month: String
//    @StateObject var color = UIColors()
    
    var body: some View {
        TextField("MM", text: $month)
            .padding()
            .frame(width: 110, height: 48)
            
            
            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(12.0)
            .padding(.bottom, 20)
    }
}

struct YearTextField: View {
    
    @Binding var year: String
//    @StateObject var color = UIColors()
    
    var body: some View {
        TextField("YYY", text: $year )
            .padding()
            .frame(width: 110, height: 48)
            .keyboardType(.namePhonePad)

            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(12.0)
            .padding(.bottom, 20)
    }
}

struct CVTextField: View {
    
    @Binding var cv: String
//    @StateObject var color = UIColors()
    
    var body: some View {
        TextField("CV", text: $cv )
            .padding()
            .frame(width: 110, height: 48)
            .keyboardType(.webSearch)
            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)))
            .cornerRadius(12.0)
            .padding(.bottom, 20)
    }
}

