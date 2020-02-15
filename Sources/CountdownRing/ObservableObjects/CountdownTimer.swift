//
//  CountdownTimer.swift
//  CirclularProgress
//
//  Created by Yoshinori Imajo on 2020/02/05.
//  Copyright © 2020 Curiosity Software Inc. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public class CountdownTimer: ObservableObject {
    public enum Status {
        case stop
        case countdown
    }

    public let objectWillChange = ObservableObjectPublisher()

    private(set) var formattedDuration: String = "00:00"
    private(set) public var limitTimeInteraval: TimeInterval
    private(set) public var nextFractionCompleted: Double = 0.0

    var formattedLimitDuration: String {
        get {
            return timeFormatter.string(from: limitTimeInteraval)!
        }
    }

    private var timer: Timer?
    private(set) public var status = Status.stop

    private lazy var timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        return formatter
    }()

    private var counter = 0 {
        willSet {
            objectWillChange.send()
        }

        didSet {
            let reverse = limitTimeInteraval - TimeInterval(integerLiteral: Int64(counter))
            formattedDuration = timeFormatter.string(from: reverse)!

            switch status {
            case .stop:
                nextFractionCompleted = 0.0
            case .countdown:
                nextFractionCompleted = Double(1 + counter) / limitTimeInteraval
            }
        }
    }

    public init(limitTimeInteraval: TimeInterval) {
        self.limitTimeInteraval = limitTimeInteraval
    }
}

@available(iOS 13.0, *)
public extension CountdownTimer {
    func start() {
        guard status != .countdown else { return }
        startTimer()
    }

    func reset() {
        status = .stop
        counter = 0
        timer?.invalidate()
    }
}

@available(iOS 13.0, *)
private extension CountdownTimer {
    func startTimer() {
        status = .countdown
        counter = 0

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.counter += 1
            if self.limitTimeInteraval <= TimeInterval(self.counter) {
                self.reset()
            }
        }
    }
}
