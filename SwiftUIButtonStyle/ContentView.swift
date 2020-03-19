//
//  ContentView.swift
//  SwiftUIButtonStyle
//
//  Created by Chang Sophia on 3/9/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counterLovey = 0
    @State private var counterFanboy = 0
    @State private var counterCrazyEyes = 0
    @State private var counterLance = 0
       
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
           
        Button(action: {print("gradient")}) {
            HStack(alignment: .center, spacing: 10){
         Image("Lovey")
                  .renderingMode(.original)
                  .resizable()
                  .scaledToFit()
                  .frame(width:60)
                
          Text("Lovey")
                  .font(.system(.title, design:.rounded))
                  .fontWeight(.black)
                  .foregroundColor(.white)
           Text("US$100")
                  .font(.system(.title, design: .rounded))
                  .fontWeight(.black)
                  .foregroundColor(.black)
             CounterButton(counter: $counterLovey, color: .orange)
          }
            .padding()
            .background(LinearGradient(gradient:Gradient(colors: [Color.red,Color.yellow]),startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
        }
         Button(action: {print("gradient")}) {
               HStack(alignment: .center, spacing:3){
                Image("Fanboy")
                         .renderingMode(.original)
                         .resizable()
                         .scaledToFit()
                         .frame(width:40)
                       
                 Text("Fanboy")
                         .font(.system(.title, design:.rounded))
                         .fontWeight(.black)
                         .foregroundColor(.white)
                
                  Text("US$80")
                         .font(.system(.title, design: .rounded))
                         .fontWeight(.black)
                         .foregroundColor(.black)
                CounterButton(counter: $counterFanboy, color: .blue)
           }
           }
         .buttonStyle(GradientBackgroundStyle())
         
        
        Button(action: {print("gradient")}) {
               HStack(spacing:0){
                Image("Crazy Eyes")
                         .renderingMode(.original)
                         .resizable()
                         .scaledToFit()
                         .frame(width:50)
                       
                 Text("CrazyEyes")
                         .font(.system(.title, design:.rounded))
                         .fontWeight(.black)
                         .foregroundColor(.white)
                  Text("US$50")
                         .font(.system(.title, design: .rounded))
                         .fontWeight(.black)
                         .foregroundColor(.black)
                 CounterButton(counter: $counterCrazyEyes, color: .gray)
                
           }
                   .padding()
                   .background(LinearGradient(gradient:Gradient(colors: [Color.gray,Color(.sRGB, red: 150/255, green: 100/255, blue: 120/255, opacity: 0.2)]),startPoint: .leading, endPoint: .trailing))
                   .cornerRadius(40)
           }
        Button(action: {print("gradient")}) {
                      HStack(spacing:10){
                       Image("Lance")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width:80)
                              
                        Text("Lance")
                                .font(.system(.title, design:.rounded))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                         Text("$500")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.black)
                                .foregroundColor(.black)
                        CounterButton(counter: $counterLance, color: Color(.sRGB, red: 0/255, green: 128/255, blue: 128/255, opacity: 1))
                  }
                          .padding()
                      .background(LinearGradient(gradient:Gradient(colors:
                        [Color(.sRGB, red: 0/255, green: 128/255, blue: 128/255, opacity: 1),Color(.sRGB, red: 32/255, green: 178/255, blue: 170/255, opacity: 0.3)]),startPoint: .leading, endPoint: .trailing))
                          .cornerRadius(40)
                  }
            Spacer()
            
            Text("$\(counterLovey*100 + counterFanboy*80 + counterCrazyEyes*50 + counterLance*500)")
                         .font(.system(size: 150, weight: .bold, design: .rounded))
                       
            Button(action: {
                       print("Plus button tapped")
                   }) {
                       Image(systemName: "plus")
                   }
                   .buttonStyle(CircularStyle())
                   
 }
        .padding(.horizontal,5)
        
        
        
       
}
   
    
struct GradientBackgroundStyle: ButtonStyle{
    
    func makeBody(configuration: Self.Configuration) -> some
        View {
            configuration.label
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                .scaleEffect(configuration.isPressed ? 0.9: 1.0)
            
    }
}
}

struct CircularStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some
        View {
            configuration.label
                .font(.largeTitle)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotationEffect(configuration.isPressed ? Angle(degrees: 180) : Angle(degrees: 0))
    }
}

struct CounterButton: View {
    @Binding
    //表示呼叫者必須要提供狀態變數的綁定，加上這個綁定，就如同建立了在ContentView中counter與CounterButton中的counter之間的雙向連結。更新在CounterButton視圖內的counter, 傳遞它自己的值回去CounentView中的counter狀態
    var counter: Int
    var color: Color
    
    var body: some View {
        
        Button(action: {
            self.counter += 1
        }) {
            Circle()
                .frame(width:70)
            .foregroundColor(color)
            .overlay(
            Text("\(counter)")
                .font(.system(size: 30, weight: .bold, design:.rounded))
                .foregroundColor(.white)
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
