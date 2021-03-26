import Foundation

@objc class Item: NSObject {
  var title: String
  init(title: String) {
    self.title = title
  }
}

let a = Item(title: "A")
let a2 = Item(title: "A")
let b = a

print("a \(a.hashValue) a2 \(a2.hashValue) b \(b.hashValue) a == b  \(a.hashValue == b.hashValue)  a == a2  \(a.hashValue == a2.hashValue)")

struct CustomItemUUID: Hashable {
  var id = UUID()
  var title: String
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: CustomItemUUID, rhs: CustomItemUUID) -> Bool {
    lhs.id == rhs.id
  }
}

let c = CustomItemUUID(title: "C")
let c2 = CustomItemUUID(title: "C")
let d = c
print("c \(c.hashValue) c2 \(c2.hashValue) d \(d.hashValue) c == d \(c.hashValue == d.hashValue) c == c2 \(c.hashValue == c2.hashValue)")

struct CustomItemTitleHash: Hashable {
  var title: String
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
  }
  
  static func == (lhs: CustomItemTitleHash, rhs: CustomItemTitleHash) -> Bool {
    lhs.title == rhs.title
  }
}

let e = CustomItemTitleHash(title: "E")
let e2 = CustomItemTitleHash(title: "E")
let f = e
print("e \(e.hashValue) e2 \(e2.hashValue) f \(f.hashValue) e == f \(e.hashValue == f.hashValue) e == e2 \(e.hashValue == e2.hashValue)")
