//
//  AppCoordinator.swift
//  Storytime
//
//  Created by Matthew Mould on 09/05/2020.
//  Copyright © 2020 Matthew Mould. All rights reserved.
//

import UIKit

struct AppCoordinator: Coordinator {
    private weak var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        StoryListCoordinator(window: window).start()
    }
}
