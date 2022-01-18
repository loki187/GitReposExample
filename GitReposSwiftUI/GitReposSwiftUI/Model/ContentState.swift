//
//  ContentState.swift
//  GitReposSwiftUI
//
//  Created by Andrej Lukes on 17/01/2022.
//

import Foundation

enum ContentState {
    case idle
    case loading
    case failed(Error)
    case loaded([GitRepository])
}
