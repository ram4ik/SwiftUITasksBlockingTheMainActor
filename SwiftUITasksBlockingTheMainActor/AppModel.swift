//
//  AppModel.swift
//  SwiftUITasksBlockingTheMainActor
//
//  Created by Ramill Ibragimov on 15.03.2024.
//

import SwiftUI

@MainActor
@Observable final class AppModel {
    
    private(set) var counter: Int = 0
    private(set) var running: Bool = false
    
    func count() {
        counter += 1
    }
    
    func start() async {
        running = await doWork()
    }
    
    private nonisolated func doWork() async -> Bool {
        sleep(10)
        return true
    }
}
