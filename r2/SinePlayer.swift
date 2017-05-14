//
//  SinePlayer.swift
//  from: http://www.tmroyal.com/playing-sounds-in-swift-audioengine.html
//

import AVFoundation

class SinePlayer {
  // store persistent objects
  var engine: AVAudioEngine
  var player: AVAudioPlayerNode

  public var tone: Float = 441.0 {
    didSet {
      print(tone)
      player.scheduleBuffer(makeBuffer(note: tone), at: nil, options: .interruptsAtLoop, completionHandler: nil)
    }
  }

  init() {
    // initialize objects
    engine = AVAudioEngine()
    player = AVAudioPlayerNode()

    // setup audio engine
    engine.attach(player)
    engine.connect(player, to: engine.mainMixerNode, format: player.outputFormat(forBus: 0))

    do {
      try engine.start()
      player.play()
    }
    catch _ {}
  }

  func makeBuffer(note: Float) -> AVAudioPCMBuffer {
    let buffer = AVAudioPCMBuffer(pcmFormat: player.outputFormat(forBus: 0), frameCapacity: 2000)
    buffer.frameLength = 2000
    // generate sine wave
    let sr:Float = Float(engine.mainMixerNode.outputFormat(forBus: 0).sampleRate)
    let n_channels = engine.mainMixerNode.outputFormat(forBus: 0).channelCount

    var i = 0
    while(i < Int(buffer.frameLength)) {
      let val = sinf(tone * Float(i) * 2 * Float(Double.pi)/sr)
      if let fcd = buffer.floatChannelData {
        fcd.pointee[i] = val * 0.5
      }
      i += Int(n_channels)
    }
    return buffer
  }

}
