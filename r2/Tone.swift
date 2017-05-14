//
//  Tone.swift
//  http://www.phy.mtu.edu/~suits/notefreqs.html
//
//  Created by Philihp Busby on 2017-05-13.
//  Copyright © 2017 Philihp Busby. All rights reserved.
//

import Foundation

enum Tone: Float {
  case C0 = 16.35
  case C0sh = 17.32
  case D0 = 18.35
  case D0sh = 19.45
  case E0 = 20.60
  case F0 = 21.83
  case F0sh = 23.12
  case G0 = 24.50
  case G0sh = 25.96
  case A0 = 27.50
  case A0sh = 29.14
  case B0 = 30.87
  case C1 = 32.70
  case C1sh = 34.65
  case D1 = 36.71
  case D1sh = 38.89
  case E1 = 41.20
  case F1 = 43.65
  case F1sh = 46.25
  case G1 = 49.00
  case G1sh = 51.91
  case A1 = 55.00
  case A1sh = 58.27
  case B1 = 61.74
  case C2 = 65.41
  case C2sh = 69.30
  case D2 = 73.42
  case D2sh = 77.78
  case E2 = 82.41
  case F2 = 87.31
  case F2sh = 92.50
  case G2 = 98.00
  case G2sh = 103.83
  case A2 = 110.00
  case A2sh = 116.54
  case B2 = 123.47
  case C3 = 130.81
  case C3sh = 138.59
  case D3 = 146.83
  case D3sh = 155.56
  case E3 = 164.81
  case F3 = 174.61
  case F3sh = 185.00
  case G3 = 196.00
  case G3sh = 207.65
  case A3 = 220.00
  case A3sh = 233.08
  case B3 = 246.94
  case C4 = 261.63
  case C4sh = 277.18
  case D4 = 293.66
  case D4sh = 311.13
  case E4 = 329.63
  case F4 = 349.23
  case F4sh = 369.99
  case G4 = 392.00
  case G4sh = 415.30
  case A4 = 440.00
  case A4sh = 466.16
  case B4 = 493.88
  case C5 = 523.25
  case C5sh = 554.37
  case D5 = 587.33
  case D5sh = 622.25
  case E5 = 659.25
  case F5 = 698.46
  case F5sh = 739.99
  case G5 = 783.99
  case G5sh = 830.61
  case A5 = 880.00
  case A5sh = 932.33
  case B5 = 987.77
  case C6 = 1046.50
  case C6sh = 1108.73
  case D6 = 1174.66
  case D6sh = 1244.51
  case E6 = 1318.51
  case F6 = 1396.91
  case F6sh = 1479.98
  case G6 = 1567.98
  case G6sh = 1661.22
  case A6 = 1760.00
  case A6sh = 1864.66
  case B6 = 1975.53
  case C7 = 2093.00
  case C7sh = 2217.46
  case D7 = 2349.32
  case D7sh = 2489.02
  case E7 = 2637.02
  case F7 = 2793.83
  case F7sh = 2959.96
  case G7 = 3135.96
  case G7sh = 3322.44
  case A7 = 3520.00
  case A7sh = 3729.31
  case B7 = 3951.07
  case C8 = 4186.01
  case C8sh = 4434.92
  case D8 = 4698.63
  case D8sh = 4978.03
  case E8 = 5274.04
  case F8 = 5587.65
  case F8sh = 5919.91
  case G8 = 6271.93
  case G8sh = 6644.88
  case A8 = 7040.00
  case A8sh = 7458.62
  case B8 = 7902.13

  public static func rand() -> Tone {
    let tones:[Tone] =
      [
//       .C0, .C0sh, .D0, .D0sh, .E0, .F0, .F0sh, .G0, .G0sh, .A0, .A0sh, .B0,
//       .C1, .C1sh, .D1, .D1sh, .E1, .F1, .F1sh, .G1, .G1sh, .A1, .A1sh, .B1,
//       .C2, .C2sh, .D2, .D2sh, .E2, .F2, .F2sh, .G2, .G2sh, .A2, .A2sh, .B2,
       .C3, .C3sh, .D3, .D3sh, .E3, .F3, .F3sh, .G3, .G3sh, .A3, .A3sh, .B3,
       .C4, .C4sh, .D4, .D4sh, .E4, .F4, .F4sh, .G4, .G4sh, .A4, .A4sh, .B4,
       .C5, .C5sh, .D5, .D5sh, .E5, .F5, .F5sh, .G5, .G5sh, .A5, .A5sh, .B5
//       .C6, .C6sh, .D6, .D6sh, .E6, .F6, .F6sh, .G6, .G6sh, .A6, .A6sh, .B6,
//       .C7, .C7sh, .D7, .D7sh, .E7, .F7, .F7sh, .G7, .G7sh, .A7, .A7sh, .B7,
//       .C8, .C8sh, .D8, .D8sh, .E8, .F8, .F8sh, .G8, .G8sh, .A8, .A8sh, .B8
      ]
    let randomIndex = Int(arc4random_uniform(UInt32(tones.count)))
    return tones[randomIndex]
  }
}
