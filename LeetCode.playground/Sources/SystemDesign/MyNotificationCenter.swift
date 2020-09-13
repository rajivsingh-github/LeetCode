import Foundation

public typealias NotificationBlock = (MyNotification) -> Void

public protocol MyNotificationIdentifiable {
    var uuid: UUID { get }
}

public struct MyNotificationIdentifier: MyNotificationIdentifiable {
    public let uuid: UUID
    
    public init() {
        uuid = UUID()
    }
}

public class MyNotification {
    let identifier: MyNotificationIdentifiable
    let name: NSNotification.Name
    let object: Any?
    let block: NotificationBlock
    
    public init(name: NSNotification.Name, identifier: MyNotificationIdentifiable, object: Any?, block: @escaping NotificationBlock) {
        self.name = name
        self.identifier = identifier
        self.object = object
        self.block = block
    }
}

public class MyNotificationCenter {
    public static let `default` = MyNotificationCenter()
    
    lazy var notificationMap = [NSNotification.Name: [MyNotification]]()
    
    public func addObserver(forName name: NSNotification.Name,
                     object: Any?,
                     block: @escaping NotificationBlock
                    ) -> MyNotificationIdentifiable
    {
        let identifier = MyNotificationIdentifier()
        let newObserver = MyNotification(name: name, identifier: identifier, object: object, block: block)
        
        if let existingObservers = notificationMap[name] {
            notificationMap[name] = existingObservers + [newObserver]
        }else {
            notificationMap[name] = [newObserver]
        }
        
        return identifier
    }
    
    public func post(name: NSNotification.Name, object: Any?) {
        guard let notifications = notificationMap[name] else {
            return
        }
        
        for notification in notifications {
            notification.block(notification)
        }
    }
    
    public func removeObserver(_ observer: Any, name: NSNotification.Name, object: Any?) {
        guard let observer = observer as? MyNotificationIdentifiable else { return }
        
        for (notificationName, notifications) in notificationMap where notificationName == name {
            var newNotifications = notifications
            newNotifications.removeAll { $0.identifier.uuid == observer.uuid }
            
            notificationMap[notificationName] = newNotifications
        }
    }
}
