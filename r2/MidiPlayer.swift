//
//  MidiPlayer.swift
//  http://stackoverflow.com/questions/33920157/playing-a-single-midi-note-from-gs-instruments-in-ios-swift
//
//  Created by Philihp Busby on 2017-05-14.
//  Copyright © 2017 Philihp Busby. All rights reserved.
//

import Foundation
import AVFoundation

class MidiPlayer {

  public let engine = AVAudioEngine()
  public let sampler = AVAudioUnitSampler()

  init() {

    engine.attach(self.sampler)
    engine.connect(self.sampler, to: engine.outputNode, format: nil)

    guard let soundbank = Bundle.main.url(forResource: "gs_instruments", withExtension: "dls") else {
      print("Could not initalize soundbank.")
      return
    }

    let melodicBank:UInt8 = UInt8(kAUSampler_DefaultMelodicBankMSB)
    let gmPiano:UInt8 = 5

    do {

      try engine.start()
      try self.sampler.loadSoundBankInstrument(at: soundbank, program: gmPiano, bankMSB: melodicBank, bankLSB: 0)

    } catch {
      print("An error occurred \(error)")
      return
    }
  }

}
