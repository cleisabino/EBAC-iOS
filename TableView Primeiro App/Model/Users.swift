//
//  Users.swift
//  TableView Primeiro App
//
//  Created by Clei Sabino Gomes De Jesus on 15/04/22.
//  Copyright © 2022 Clei Sabino Gomes De Jesus. All rights reserved.
//

import Foundation

struct Users: Codable {
    let data: [User]
}

struct User: Codable {
    var id:String?
    var name: String?
    var avatar: String?
    var createdAt: String?
}

