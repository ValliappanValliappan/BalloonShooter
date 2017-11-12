//
//  ViewController.swift
//  BalloonShooter
import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, SCNSceneRendererDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var transform : matrix_float4x4!
<<<<<<< HEAD
=======
    var targetCreationTime:TimeInterval = 0
    let egg = SCNScene(named: "Egg.scn")!
>>>>>>> parent of fc68387... hope this works
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //transform=sceneView.session.currentFrame?.camera.transform
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        sceneView.scene = scene
        
        // Set the scene to the view
        let cupnode=SCNNode()
        let cupScene=SCNScene(named: "Bucket.scn")!
        for child in cupScene.rootNode.childNodes {
            cupnode.addChildNode(child)
        }
        //cupnode.position=SCNVector3Make(0.1, 0.1, 0.1)
        //scene.rootNode.addChildNode(cupnode)
        cupnode.scale=SCNVector3(0.005,0.005,0.005)
        //cupnode.position=SCNVector3Make(-0.5, 0, 0)
        sceneView.pointOfView?.addChildNode(cupnode)
        
        sceneView.scene = scene
        sceneView.allowsCameraControl=true
        
        //var cupnode=SCNNode()
        sceneView.scene.rootNode.addChildNode(cupnode)

<<<<<<< HEAD
        game()
=======

        var i=0

        //while i==0{
         //   transform = sceneView.session.currentFrame?.camera.transform
         //   cupnode.position=SCNVector3Make((transform?.columns.3.x)!, (transform?.columns.3.y)!, (transform?.columns.3.z)!)
        //    sceneView.scene.rootNode.addChildNode(cupnode)
        //}

>>>>>>> parent of fc68387... hope this works
    }
    func followCamera(){
            }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    func createEgg() {
        let egg = SCNScene(named: "Egg.scn")!
        let eggnode = SCNNode()
        for child in egg.rootNode.childNodes {
            eggnode.addChildNode(child)
        }
        let A: Int = -1 // UInt32 = 32-bit positive integers (unsigned)
        let B: Int = 1
        let number = Int(arc4random_uniform(UInt32(B - A + 1))) + A
        Float32(number)
<<<<<<< HEAD
        eggnode.position = SCNVector3(number, -1, -2)
=======
        eggnode.position = SCNVector3(number, -1, 10)
>>>>>>> parent of fc68387... hope this works
        eggnode.scale = SCNVector3(0.09, 0.09, 0.09)
        sceneView.scene.rootNode.addChildNode(eggnode)
        eggnode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        if eggnode.position.z <= -5 {
            eggnode.physicsBody = SCNPhysicsBody(type: SCNPhysicsBodyType.static, shape: nil)
<<<<<<< HEAD
=======
        }
    }
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if time > targetCreationTime {
            createEgg()
            targetCreationTime = time + 0.6
>>>>>>> parent of fc68387... hope this works
        }
        cleanUp()
    }
<<<<<<< HEAD
    func game() {
        var a = 5
        while a >= 0 {
            createEgg()
            a -= 1
=======
    
    func cleanUp() {
        for node in egg.rootNode.childNodes {
            if node.presentation.position.y < -5 {
                node.removeFromParentNode()
            }
>>>>>>> parent of fc68387... hope this works
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
class Beginning:UIViewController{
    @IBOutlet var radius: UITextField!
    let maxRadius=3.0
    @IBAction func help(_ sender: Any) {
        let help=HelpViewController()
        present(help, animated: true, completion: nil)
    }
    @IBAction func start(_ sender: UIButton) {
        if(Double(radius.text!)!<=maxRadius){
            let next=ViewController()
            present(next, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
class HelpViewController:UIViewController{
    
    @IBAction func goBack(_ sender: Any) {
        let back=Beginning()
        present(back, animated: true, completion: nil)
    }
}
