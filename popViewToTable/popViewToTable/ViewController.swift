//
//  ViewController.swift
//  Graph
//
//  Created by Thor on 6/3/16.
//  Copyright © 2016 Thor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    @IBOutlet weak var dataPressed: UIButton!
    @IBAction func buttonPressed(sender: UIButton) {
        print("Button Pressed")
        showPopOver(sender)
        print("ButtonPressed and function called")
    }
    func showPopOver(button:UIButton) {
        print("popO start of function")
        let popO = self.storyboard?.instantiateViewControllerWithIdentifier("popoverController") as UIViewController!
        print("popO code last breakpoint")
        popO.modalPresentationStyle = .Popover
        popO.preferredContentSize = CGSizeMake(200, 400)
        let popoverPresentationController = popO.popoverPresentationController
        popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Left
        popoverPresentationController?.sourceView = button // solves problem of bug, see notes at bottom
        popoverPresentationController?.sourceRect = button.bounds
        
        presentViewController(popO, animated: true, completion: nil)
    }
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let anchorView = UIView(frame: view.bounds)
        switch segue.identifier {
        case "PopoverID"?:
            if #available(iOS 9.0, *) {
                segue.destinationViewController.popoverPresentationController!.sourceRect = anchorView.frame
            }
        default:
            break
        }
    }
 */
    
//    func showPopover() {
/*
    func prepareForPopoverPresentation(popoverPresentationController: UIPopoverPresentationController) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("popoverController") as! PopoverViewController
        vc.modalPresentationStyle = .Popover
        vc.preferredContentSize = CGSizeMake(100, 100)
        if let popC = vc.popoverPresentationController {
            popC.delegate = self
            popC.permittedArrowDirections = .Down
            popC.sourceView = self.view
            // popC.sourceRect = CGRectMake(0, 0, 50, 50)
            // popC.sourceRect = CGRectMake(0, -100, 5, 5)
            // CGRectMake(x,y,w,h)
            self.presentViewController(vc, animated: true, completion: nil)
        }

        
    }
*/
// NOTE:  See Comment for important note re: popover
// // // // // // // // // // // // // // // // // //
    
        // bug in iOS 9, sourceRect for popover is not set, two fixes:
        // run override func prepareForSegue()
            // case "Popover Identifier"?: // ios9.x only, use ObjC for earlier, see commented out below
            // if #available(iOS 9.0, *) {
            // segue.destinationViewController?.popoverPresentationController.sourceRect = anchorView.frame
        // create UIViewController Extension
            // extension UIViewController
            // func popOverFix4iOS9(segue:UIStoryboardSegue?)
            // guard
            // if let popOver = segue?.destinationViewController.popoverPresentationController,
            //    let anchor = popOver.sourceView
           // where popOver.sourceRect = CGRect() && segue!.sourceViewController == self
           // { popover.sourceRect = anchor.bounds }

    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // popover is also anchored to the
        return .None
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*
extension UIViewController
{
    func popOverFix4iOS9(segue:UIStoryboardSegue?) {
        guard #available(iOS 9.0, *) else { return }
        if let popOver = segue?.destinationViewController.popoverPresentationController,
            let anchor = popOver.sourceView
            where popOver.sourceRect == CGRect() && segue!.sourceViewController == self
        { popOver.sourceRect = anchor.bounds }
    }
}
 */