//
//  ContentView.swift
//  CountdownRingDemo
//
//  Created by Yoshinori Imajo on 2020/02/05.
//  Copyright © 2020 Curiosity Software Inc. All rights reserved.
//

import SwiftUI
import CountdownRing

struct ContentView: View {
    @ObservedObject var countdownTimer: CountdownTimer

    var body: some View {
        VStack {
            ZStack {
                CountdownRingView(
                    countdownTimer: countdownTimer,
                    gradientColors: [.pink, .red],
                    lineWidth: 34
                )
                .padding(.bottom, 0.0)

                TimerTextView(countdownTimer: self.countdownTimer)
            }
            .frame(maxWidth: 400, maxHeight: 400)

            Button(action: {
                self.buttonAction()
            }) {
                Text(buttonTitle)
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            }
            .frame(maxWidth: 180, maxHeight: 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

private extension ContentView {

    func buttonAction() {
        switch countdownTimer.status {
        case .stop:
            countdownTimer.start()
        case .countdown:
            countdownTimer.reset()
        }
    }

    var buttonTitle: String {
        switch countdownTimer.status {
        case .stop:
            return "Push Start"
        default:
            return "Push Reset"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(countdownTimer: CountdownTimer(limitTimeInteraval: 10))
    }
}
