//
//  Messages.swift
//  ChatAPP
//
//  Created by Yery Castro on 9/3/23.
//

import Foundation

struct Messages: Identifiable, Codable {
    var id: String
    var text: String
    var username: String
    var idUser: String
    var timestmap: Date
}
