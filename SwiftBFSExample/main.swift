//
//  main.swift
//  SwiftBFSExample
//
//  Created by Angelos Staboulis on 24/7/23.
//

import Foundation
import GameplayKit
fileprivate let knightMoves = [
    [ 2, -1],
    [ 2,  1],
    [-2,  1],
    [-2, -1],
    [ 1,  2],
    [ 1, -2],
    [-1,  2],
    [-1, -2]
]
class Node:GKGraphNode{
    let x:Int
    let y:Int
    let dist:Int
    init(x:Int,y:Int,dist:Int=0) {
        self.x = x
        self.y = y
        self.dist = dist
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func addConnections(nodesArray: [GKGraphNode], bidirectional: Bool) {
        super.addConnections(to: nodesArray, bidirectional: bidirectional)
    }
    public func removeConnections(nodesArray: [GKGraphNode], bidirectional: Bool) {
        super.removeConnections(to: nodesArray, bidirectional: bidirectional)
    }
}
class Queue{
    
    var list:[Node] = []
    
    init(list:[Node]){
        self.list = list
    }
    
    func enquee(data:Node){
        list.append(data)
    }
    func dequee( )-> Node{
        if self.list.isEmpty {
            return Node(x: 0, y: 0)
        }else{
            return list.removeFirst()
        }
    }
}
class Graph:GKGraph{
     public func findPaths(from startNode: GKGraphNode, to endNode: GKGraphNode) -> [GKGraphNode]
    {
        super.findPath(from: startNode, to: endNode)
    }
    func bfs(src:Node,dest:Node) -> Int{
        var visited:[Node:Bool] = [:]
        let queue = Queue(list: [Node]())
        queue.enquee(data: src)
        while !queue.list.isEmpty{
            let node = queue.dequee()
            if node.x == dest.x && node.y == dest.y { return node.dist}
            if visited[node] == nil {
                visited[node] = true
                for item in 0..<knightMoves.count{
                    queue.enquee(data: Node(x: node.x + knightMoves[item][0], y: node.y + knightMoves[item][1], dist: node.dist + 1))
                }
            }
        }
        return -1
    }
}

let nodeSrc = Node(x: 0, y: 0)
let nodeDest = Node(x: 7, y: 0)
let graph = Graph([nodeSrc,nodeDest])
let a = graph.bfs(src: nodeSrc, dest: nodeDest)
debugPrint("minimum steps=",a)
