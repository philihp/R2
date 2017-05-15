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
      //let tone = UInt8(arc4random_uniform(128))

      //let chord: [UInt8] = [0, 2, 4, 5, 7, 9, 11]
      //let randomIndex = Int(arc4random_uniform(UInt32(chord.count)))
      let note = UInt8(arc4random_uniform(20) + 60)
      let time = Int(arc4random_uniform(2)+1)

      self.midiPlayer.sampler.startNote(note, withVelocity: 127, onChannel: 0)
      Timer.scheduledTimer(withTimeInterval: Double(time) / 8, repeats: false) { timer in
        self.midiPlayer.sampler.stopNote(note, onChannel: 0)
      }
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

