//
//  Model.swift
//  Escaping
//
//  Created by Frédéric Helfer on 01/11/22.
//

import Foundation

struct DownloadResult {
    var data: String
}

typealias DownloadCompletion = (_ data: DownloadResult) -> ())
