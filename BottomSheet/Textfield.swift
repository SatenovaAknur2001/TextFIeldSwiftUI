//
//  Textfield.swift
//  BottomSheet
//
//  Created by Акнур on 02.08.2021.
//

import SwiftUI


let colorTint = Color(#colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1))
let colorText = Color(#colorLiteral(red: 0.662745098, green: 0.6745098039, blue: 0.6901960784, alpha: 1))
struct BottomSheet: View {
    @State var cardNumber = ""
    @State var offset = CGSize.zero
    @State var showView = false
    @State var index = 0

  
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation(.spring()) {
                    showView.toggle()
                }
            }){
                Text("Показать")
                
            }
            
            VStack(alignment: .leading, spacing: 45) {
                Capsule()
                    .fill(Color.white)
                    .frame(width: 50, height: 6)
                    .offset(y: -30)
                Text("Редактирование карты")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text("Номер карты")
                

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

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}

struct CardInfoText: View {
    var text: String
    var body: some View {
        Text(text)
            .frame(height: 60)
         
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 12.0).fill(colorTint))
            .foregroundColor(colorText)
    }
}
