# Interface Segregation Principle (ISP)

**Concept:** Clients should not be forced to depend on interfaces they do not use. Split large interfaces into smaller, more specific ones.

**How it is applied here:**
Instead of a giant `Item` interface that forces every item to have `equip()` and `consume()` methods, I created specific interfaces in `lib/models/items/`:
- `Consumable`: Only has a `consume()` method.
- `Equippable`: Only has an `equip()` method.

Now, a `HealthPotion` only implements `Consumable`. It is never forced to write dummy code for an `equip()` method it will never use.