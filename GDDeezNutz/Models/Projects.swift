//
//  Projects.swift
//  GDDeezNutz
//
//  Created by Aaron Christopher Tanhar on 31/03/23.
//

import Foundation

struct Projects: Identifiable {
    let id = UUID()
    var title: String
    var description: String
}


extension Projects {
    static let sampleData: [Projects] =
    [
        Projects(title: "Stardeez Valnutz", description: "Banger game"),
        Projects(title: "Call of Dooty", description: "Banger game"),
    ]
}
