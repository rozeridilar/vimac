import Cocoa
import RxSwift

class InputListener {
    let events: Observable<NSEvent> =
        Observable.create({ observer in
            let keyMonitor = NSEvent.addLocalMonitorForEvents(matching: NSEvent.EventTypeMask.keyDown.union(.keyUp), handler: { event -> NSEvent? in
                observer.onNext(event)
                // return nil to prevent the event from being dispatched
                // this removes the "doot doot" sound when typing with CMD / CTRL held down
                return nil
            })!
            
            let cancel = Disposables.create {
                NSEvent.removeMonitor(keyMonitor)
            }
            return cancel
        })
        .share()
    
    lazy var keyDownEvents: Observable<NSEvent> = events.filter({ event in
        return event.type == .keyDown
    })
    
    lazy var keyUpEvents: Observable<NSEvent> = events.filter({ event in
        return event.type == .keyUp
    })
}
