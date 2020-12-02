//
//  Slide.swift
//  Trafel
//
//  Created by Yauheni Kozich on 26.11.20.
//

import Foundation

struct Slide {
    let imageName: String
    let title: String
    let description: String
    
    static let collection: [Slide] = [
        Slide(imageName: "image1", title: "Why use Trafel?", description: "Trafel allows you to travel around the world,make new friends and create memorible expiriences"),
        Slide(imageName: "image2", title: "Any of your text", description: "Go next"),
        Slide(imageName: "image3", title: "Your description?", description: "I like to draw in my free time"),
        
    ]
}
