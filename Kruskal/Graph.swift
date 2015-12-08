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
        if !vertices.contains(edge.vertices[0]){
            AddVertex(edge.vertices[0])
        }
        if !vertices.contains(edge.vertices[1]){
            AddVertex(edge.vertices[1])
        }
    }
    
    func AddVertex(vertex: Int){
        vertices.append(vertex)
    }
    
    func SortEdges(){
        edges.sortInPlace({$0.weight < $1.weight})
    }
    
    func SetGraphFromMatrix(inputMatrix: [[Int]]){
        for i in 0...inputMatrix.count-1 {
            for j in i...inputMatrix.count-1 {
                if inputMatrix[i][j] != 0 {     // ADD EDGES TO THE GRAPH
                    AddEdge(Edge(weight: inputMatrix[i][j], vertex1: i+1, vertex2: j+1))
                }
            }
        }
    }
    
    func SetGraph(inputMatrix: [[Int]]){
        for i in 0...inputMatrix[0].count-1{
            AddEdge(Edge(weight: inputMatrix[2][i], vertex1: inputMatrix[0][i], vertex2: inputMatrix[1][i]))
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
    
    func ConvertToList() -> [[Int]]{
        var list: [[Int]] = [[],[],[]]
        for edge in edges{
            list[0].append(edge.vertices[0])
            list[1].append(edge.vertices[1])
            list[2].append(edge.weight)
        }
        return list
    }
    
    func PrintMatrix(){
        for i in vertices{
            print(ConvertToMatrix()[i-1])
        }
    }
    
    func PrintList(){
        for i in 0...2{
            print(ConvertToList()[i])
        }
    }
}