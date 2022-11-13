//
//  DragGestureBootcamp2.swift
//  Gestures
//
//  Created by Frédéric Helfer on 13/11/22.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    @State var startingOffSetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffSetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffSetY
                                } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                            }
                        }
                )
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct DragGestureBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp2()
    }
}

struct MySignUpView: View {
    var body: some View {
        VStack {
            Image(systemName: "chevron.up")
                .padding(.top)
            
            Text("Sing up")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("This is the description for our app. This is my favorite swiftUI cours.......")
                .multilineTextAlignment(.center)
            
            Text("CREATE AN ACCOUNT")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(.black)
                .cornerRadius(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
