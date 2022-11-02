//
//  Model.swift
//  DownloadWithCombine
//
//  Created by Frédéric Helfer on 01/11/22.
//

import Foundation

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
