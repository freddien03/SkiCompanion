//
//  SessionView.swift
//  SkiCompanion
//
//  Created by Freddie Nunn on 17/09/2021.
//

import SwiftUI

struct SessionView: View {
    @State private var isSession = false
    @State private var progressTime = 0
    @State private var isRunning = false
    var hours: Int {
        progressTime/3600
    }
    var minutes: Int {
        (progressTime % 3600) / 60
    }
    var seconds: Int {
        progressTime % 60
    }
    @State private var timer: Timer?
    var body: some View {
        VStack {
            Text("\(hours):\(minutes):\(seconds)")
                .font(.system(size: 50))
                .bold()
                .padding()
            HStack{
                Button(action: {
                    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                        progressTime += 1
                    })
                    isSession.toggle()
                    isRunning.toggle()
                }){
                    if !isSession{
                        Text("Start")
                    }
                }
                
                Button(action: {
                    if isRunning{
                        timer?.invalidate()
                    }else{
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                            progressTime += 1
                        })
                    }
                    isRunning.toggle()
                }){
                    if isSession{
                        if isRunning{
                            Text("Pause")
                        }else{
                            Text("Resume")
                        }
                    }
                }
                
                Button(action: {
                    timer?.invalidate()
                    isRunning = false
                    isSession = false
                    progressTime = 0
                }){
                    if isSession{
                        Text("Stop")
                    }
                }
            }
            .padding()
        }
        
    }
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}
