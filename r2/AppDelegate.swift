//
//  AppDelegate.swift
//  r2
//
//  Created by Philihp Busby on 2017-05-13.
//  Copyright © 2017 Philihp Busby. All rights reserved.
//

import Cocoa
import AppKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  var monitor: EventMonitor?
  let sinePlayer = SinePlayer()

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    trust()
    monitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown, .keyDown, .keyUp]) { (event) in
      //self.sinePlayer.tone =  round(Float(arc4random()) / Float(UINT32_MAX) * 500) + 300
      self.sinePlayer.tone = Tone.rand().rawValue
      
    }
    monitor?.start()
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    monitor = nil
  }

  func trust() {
    let trusted = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString
    let privOptions = [trusted: true]
    AXIsProcessTrustedWithOptions(privOptions as CFDictionary?)
  }

}

