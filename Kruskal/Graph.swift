//
//  Graph.swift
//  Kruskal
//
//  Created by Ergin Bilgin on 22/11/15.
//  Copyright © 2015 Ergin Bilgin. All rights reserved.
//

import Foundation

class Graph{
    var vertices: [Int]
    var edges: [Edge]
    
    init(){
        vertices = []
        edges = []
    }
    
    func AddEdge(edge: Edge){
        edges.append(edge)
    }
    
    func AddVertex(vertex: Int){
        vertices.append(vertex)
    }
    
    func SortEdges(){
        edges.sortInPlace({$0.weight < $1.weight})
    }
    
    func SetGraph(inputMatrix: [[Int]]){
        for i in 0...inputMatrix.count-1 {
            AddVertex(i+1)                      // ADD VERTICES TO THE GRAPH
            for j in i...inputMatrix.count-1 {
                if inputMatrix[i][j] != 0 {     // ADD EDGES TO THE GRAPH
                    AddEdge(Edge(weight: inputMatrix[i][j], vertex1: i+1, vertex2: j+1))
                }
            }
        }
    }
    
    func Kruskal() -> Graph{
        let minimumSpanningTree = Graph()
        SortEdges()
        var components: [Int] = []      // CONNECTIVITY COMPONENTS
        for vertex in vertices {
            components.append(vertex)
        }
        for edge in edges{                                               // IF COMPONENTS ARE NOT SAME
            if components[edge.vertices[0]-1] != components[edge.vertices[1]-1]{
                minimumSpanningTree.AddEdge(edge)                              // ADD EDGE TO THE TREE
                if !minimumSpanningTree.vertices.contains(edge.vertices[0]){ // IF NOT INCLUDED ADD V1
                    minimumSpanningTree.vertices.append(edge.vertices[0])
                }
                if !minimumSpanningTree.vertices.contains(edge.vertices[1]){ // IF NOT INCLUDED ADD V2
                    minimumSpanningTree.vertices.append(edge.vertices[1])
                }
                let componentToSearch = components[edge.vertices[1]-1]          // COMPONENT TO CHANGE
                for i in 0...components.count-1{                   // SEARCH AND CHANGE ALL COMPONENTS
                    if components[i] == componentToSearch {
                        components[i] = components[edge.vertices[0]-1]
                    }
                }
            }
        }
        minimumSpanningTree.vertices.sortInPlace()   // SORT VERTICES
        return minimumSpanningTree
    }
    
    func ConvertToMatrix() -> [[Int]]{
        var matrix:[[Int]] = []
        var line: [Int] = []
        for _ in vertices{
            line.append(0)
        }
        for _ in vertices{
            matrix.append(line)
        }
        for edge in edges{
            matrix[edge.vertices[0]-1][edge.vertices[1]-1] = edge.weight
            matrix[edge.vertices[1]-1][edge.vertices[0]-1] = edge.weight

        }
        return matrix
    }
    
    func Print(){
        for i in vertices{
            print(ConvertToMatrix()[i-1])
        }
    }
}