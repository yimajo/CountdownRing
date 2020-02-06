//
//  TimerTextView.swift
//  CirclularProgress
//
//  Created by Yoshinori Imajo on 2020/02/05.
//  Copyright © 2020 Curiosity Software Inc. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct TimerTextView: View {

    @Environment(\.fontColor) private var fontColor
    @ObservedObject var countdownTimer: CountdownTimer
    private(set) var textSize: CGFloat
    private(set) var limitTextSize: CGFloat
    private(set) var bellSize: CGFloat

    public init(
        countdownTimer: CountdownTimer,
        textSize: CGFloat = 90,
        limitTextSize: CGFloat = 32,
        bellSize: CGFloat = 20
    ) {
        self.countdownTimer = countdownTimer
        self.textSize = textSize
        self.limitTextSize = limitTextSize
        self.bellSize = bellSize
    }

    public var body: some View {
        return VStack(alignment: .center) {
            Spacer()

            Text(countdownTimer.formattedDuration)
                .font(.system(size: textSize, design: .monospaced))
                .lineLimit(1)
                .padding(.horizontal, 24.0)
                .minimumScaleFactor(.leastNonzeroMagnitude)
                .foregroundColor(fontColor)

            Spacer()
                .frame(height: 10)

            HStack {
                Image(systemName: "bell.fill")
                    .font(.system(size: bellSize))
                    .foregroundColor(fontColor)

                Text(countdownTimer.formattedLimitDuration)
                    .font(.system(size: limitTextSize, design: .monospaced))
                    .lineLimit(1)
                    .minimumScaleFactor(0.9)
                    .foregroundColor(fontColor)
            }
            Spacer()
        }
    }
}

@available(iOS 13.0, *)
struct TimerTextView_Previews: PreviewProvider {
    static var previews: some View {
        TimerTextView(countdownTimer: CountdownTimer(limitTimeInteraval: 10))
            .background(Color.black)
    }
}
