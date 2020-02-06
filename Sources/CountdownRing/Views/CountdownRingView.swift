//
//  CountdownRing.swift
//
//
//  Created by Yoshinori Imajo on 2020/02/05.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CountdownRingView: View {

    @ObservedObject var countdownTimer: CountdownTimer

    private(set) var gradientColors: [Color]
    private(set) var lineWidth: CGFloat

    public init(
        countdownTimer: CountdownTimer,
        gradientColors: [Color] = [.red, .pink],
        lineWidth: CGFloat = 30
    ) {
        self.gradientColors = gradientColors
        self.lineWidth = lineWidth
        self.countdownTimer = countdownTimer
    }

    public var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    AnimationRingShape(remain: (1 - self.countdownTimer.nextFractionCompleted))
                        .stroke(
                            LinearGradient(
                                gradient: .init(colors: self.gradientColors),
                                startPoint: .init(x: 0.5, y: 0.0),
                                endPoint: .init(x: 0.5, y: 0.6)
                            ),
                            style: .init(
                                lineWidth: self.lineWidth,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.init(degrees: -90))
                        .animation(self.countdownTimer.status == .countdown ? self.animation : nil)
                }
            }
            .aspectRatio(1, contentMode: .fit)
                .padding(20)
        }
    }
}

@available(iOS 13.0, *)
private extension CountdownRingView {
    var animation: Animation {
        Animation
            .linear(duration: 1)
            .repeatCount(1)
    }
}

@available(iOS 13.0, *)
struct RingSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownRingView(countdownTimer: CountdownTimer(limitTimeInteraval: 10))
    }
}

