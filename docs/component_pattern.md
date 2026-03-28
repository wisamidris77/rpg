# Component Pattern (Composition)

**Concept:** Build complex objects by plugging independent "components" into them, rather than building massive, rigid family trees of subclasses.

**When to use it:**
When entities share overlapping, but non-identical, sets of behaviors. It is the gold standard for game entities and complex UI objects.

**The "Wrong" Way (What to avoid):**
Using deep inheritance. If you have a `Hero`, and you want them to burn, you create a `BurningHero` subclass. Then you need them to be poisoned, so you make a `PoisonedBurningHero`. It creates an unmaintainable nightmare.

**How it is applied here:**
- The `Damageable` entity acts as a dumb container. 
- It holds a `List<StatusEffect> activeEffects`. 
- Instead of changing what the Hero *is*, we just hand the Hero a "Burn Component" to hold. The engine loops through whatever components the entity happens to be holding and triggers them.

**When it is WRONG to use this:**
When the object has a strict, unchangeable "Is-A" relationship that won't grow. A `Square` inheriting from `Shape` makes sense. A `Square` holding a `ShapeComponent` is just confusing.