//
//  main.swift
//  SwiftBFSExample
//
//  Created by Angelos Staboulis on 24/7/23.
//

import Foundation
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

struct Node:Equatable,Hashable{
    let x:Int
    let y:Int
    let dist:Int
    init(x:Int,y:Int,dist:Int=0 ) {
        self.x = x
        self.y = y
        self.dist = dist
    }
    static func == (lhs:Node,rhs:Node) -> Bool{
        lhs.x == rhs.x && lhs.y == rhs.y
    }
    func hash(into hasher: inout Hasher) {
        
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
let a = bfs(src:Node(x: 0, y: 0),dest:Node(x: 7, y: 0))
debugPrint("minimum steps=",a)
