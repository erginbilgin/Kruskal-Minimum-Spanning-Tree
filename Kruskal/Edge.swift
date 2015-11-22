//
//  Edge.swift
//  Kruskal
//
//  Created by Ergin Bilgin on 22/11/15.
//  Copyright © 2015 Ergin Bilgin. All rights reserved.
//

import Foundation

class Edge {
    var weight: Int
    var vertices: [Int]
    
    init(){
        weight = 0
        vertices = []
    }
    
    init(weight: Int, vertex1: Int, vertex2: Int){
        self.weight = weight
        vertices = [vertex1, vertex2]
    }
}