//
//  LongPressGesture.swift
//  Gestures
//
//  Created by Frédéric Helfer on 12/11/22.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State var isLoading = false
    @State var isSuccess = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isLoading ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                        
                    } onPressingChanged: { isPressing in
                        // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isLoading = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isLoading = false
                                    }
                                }
                            }
                        }
                    }


                
                Text("RESET")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isLoading = false
                        isSuccess = false
                    }
            }
        }
    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
