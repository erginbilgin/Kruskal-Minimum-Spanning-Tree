//
//  main.swift
//  Kruskal
//
//  Created by Ergin Bilgin on 22/11/15.
//  Copyright © 2015 Ergin Bilgin. All rights reserved.
//

import Foundation

print("GRAPH LOADING...")

var inputMatrix: [[Int]] = [[0,  6,  8,  6,  0, 0],         // 6 8 6 5 10 7 5 3 3
                            [6,  0,  0,  5, 10, 0],         // 3 3 5 5 6 6 7 8 10
                            [8,  0,  0,  7,  5, 3],         // MST SHOULD BE:
                            [6,  5,  7,  0,  0, 0],         // 6 5 7 3 3
                            [0, 10,  5,  0,  0, 3],         // 3 3 5 6 7 
                            [0,  0,  3,  0,  3, 0]]         //

print("EDGES LOADING...")
var myg = Graph()
myg.SetGraph(inputMatrix)
print("KRUSKAL STARTING...")
var tree = myg.Kruskal()
print("KRUSKAL FINISHED...")
print("PRINTING GRAPH...")
tree.Print()
print("FINISHED...")

