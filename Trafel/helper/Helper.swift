//
//  helper.swift
//  Trafel
//
//  Created by Yauheni Kozich on 21.11.20.
//

import UIKit

func delay(durationInSeconds seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
