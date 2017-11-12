//
//  ViewController.swift
//  BalloonShooter
import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
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
    func eggMath() {
        
    }
    
    func createEgg(position: SCNVector3) {
        func createEgg(position: SCNVector3) {
            let egg = SCNScene(named: "art.scnassests/egg.obj")!
            let eggnode = SCNNode()
            for child in egg.rootNode.childNodes {
                eggnode.addChildNode(child)
            }
            eggnode.position = SCNVector3(0, -1, -2)
            sceneView.scene.rootNode.addChildNode(eggnode)
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
