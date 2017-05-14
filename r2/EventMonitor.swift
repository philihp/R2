//
//  EventMonitor.swift
//  r2
//
//  Created by Philihp Busby on 2017-05-13.
//  Copyright © 2017 Philihp Busby. All rights reserved.
//

import Foundation
import AppKit

public class EventMonitor {
  private var monitor: Any?
  private let mask: NSEventMask
  public typealias EventHandler = (NSEvent?) -> ()
  private let handler: EventHandler

  public init(mask: NSEventMask, handler: @escaping EventHandler) {
    self.mask = mask
    self.handler = handler
  }

  deinit {
    stop()
  }

  public func start() {
    monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
  }

  public func stop() {
    if let monitor = monitor {
      NSEvent.removeMonitor(monitor)
      self.monitor = nil
    }
  }
}
