//
//  OverlayWindow.swift
//  ViMac-Swift
//
//  Created by Dexter Leng on 8/9/19.
//  Copyright © 2019 Dexter Leng. All rights reserved.
//

import Cocoa

class OverlayWindow: NSPanel {
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: NSZeroRect, styleMask: .nonactivatingPanel, backing: backingStoreType, defer: flag)
        self.isOpaque = false
        self.backgroundColor = NSColor.clear
        self.level = .popUpMenu
        self.ignoresMouseEvents = true
    }

    override var canBecomeKey: Bool {
        return true
    }
}
