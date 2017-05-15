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
  let midiPlayer = MidiPlayer()

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    trust()
    monitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown, .keyDown, .keyUp]) { (event) in

      // using the sine player, you get annoying little pops at the end and beginning of all of the samples.
      //self.sinePlayer.tone = Tone.rand().rawValue
      let tone = UInt8(arc4random_uniform(128))
      self.midiPlayer.sampler.startNote(tone, withVelocity: 64, onChannel: 0)
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

