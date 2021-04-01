//
//  GameScene.swift
//  CovidGame
//
//  Created by Ugurcan Demir on 3/31/21.
//

import SpriteKit
import GameplayKit

enum CollisionType:UInt32{
    
    case player = 1
    case playerWeapon = 2
    case enemy = 4
    case enemyWeapon = 8
}


class GameScene: SKScene {
    
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
    let player = SKSpriteNode(imageNamed: "player")
    
    let waves = Bundle.main.decode([Wave].self, from: "waves.json")
    let enemyTypes = Bundle.main.decode([EnemyType].self, from: "enemy-types.json")
    
    override func didMove(to view: SKView) {
        if let particles = SKEmitterNode(fileNamed: "Startfield"){
        particles.position = CGPoint(x:1080,y:0)
            particles.advanceSimulationTime(60)
        particles.zPosition = -1
        addChild(particles)
    
        }
        player.name = "player"
        player.position.x = frame.minX + 75
        player.zPosition = 1
        addChild(player)
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        player.physicsBody?.collisionBitMask = CollisionType.enemy.rawValue | CollisionType.enemyWeapon.rawValue
        player.physicsBody?.contactTestBitMask = CollisionType.enemy.rawValue | CollisionType.enemyWeapon.rawValue
        player.physicsBody?.isDynamic = false

    }

}
