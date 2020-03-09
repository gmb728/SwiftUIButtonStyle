//
//  ContentView.swift
//  SwiftUIButtonStyle
//
//  Created by Chang Sophia on 3/9/20.
//  Copyright © 2020 Chang Sophia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
        Button(action: {print("gradient")}) {
        HStack(spacing:10){
         Image("Lovey")
                  .renderingMode(.original)
                  .resizable()
                  .scaledToFit()
                  .frame(width:100)
                
          Text("Lovey")
                  .font(.system(.title, design:.rounded))
                  .fontWeight(.black)
                  .foregroundColor(.white)
           Text("US$100")
                  .font(.system(.title, design: .rounded))
                  .fontWeight(.black)
                  .foregroundColor(.black)
          }
            .padding()
            .background(LinearGradient(gradient:Gradient(colors: [Color.red,Color.yellow]),startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
        }
         Button(action: {print("gradient")}) {
               HStack(spacing:10){
                Image("Fanboy")
                         .renderingMode(.original)
                         .resizable()
                         .scaledToFit()
                         .frame(width:100)
                       
                 Text("Fanboy")
                         .font(.system(.title, design:.rounded))
                         .fontWeight(.black)
                         .foregroundColor(.white)
                  Text("US$80")
                         .font(.system(.title, design: .rounded))
                         .fontWeight(.black)
                         .foregroundColor(.black)
           }
           }
             .buttonStyle(GradientBackgroundStyle())
        
        Button(action: {print("gradient")}) {
               HStack(spacing:5){
                Image("Crazy Eyes")
                         .renderingMode(.original)
                         .resizable()
                         .scaledToFit()
                         .frame(width:100)
                       
                 Text("Crazy Eyes")
                         .font(.system(.title, design:.rounded))
                         .fontWeight(.black)
                         .foregroundColor(.white)
                  Text("US$50")
                         .font(.system(.title, design: .rounded))
                         .fontWeight(.black)
                         .foregroundColor(.black)
           }
                   .padding()
                   .background(LinearGradient(gradient:Gradient(colors: [Color.gray,Color(.sRGB, red: 150/255, green: 100/255, blue: 120/255, opacity: 0.2)]),startPoint: .leading, endPoint: .trailing))
                   .cornerRadius(40)
           }
        Button(action: {print("gradient")}) {
                      HStack(spacing:20){
                       Image("Lance")
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .frame(width:100)
                              
                        Text("Lance")
                                .font(.system(.title, design:.rounded))
                                .fontWeight(.black)
                                .foregroundColor(.white)
                         Text("$500")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.black)
                                .foregroundColor(.black)
                  }
                          .padding()
                      .background(LinearGradient(gradient:Gradient(colors:
                        [Color(.sRGB, red: 0/255, green: 128/255, blue: 128/255, opacity: 1),Color(.sRGB, red: 32/255, green: 178/255, blue: 170/255, opacity: 0.3)]),startPoint: .leading, endPoint: .trailing))
                          .cornerRadius(40)
                  }
            Spacer()
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
