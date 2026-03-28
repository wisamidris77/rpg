# Extension Methods (Traits)

**Concept:** Attaching default logic to an interface from the outside, allowing multiple unrelated classes to share the exact same boilerplate code for free.

**When to use it:**
When you need strict interfaces (pure contracts) but you are forced to copy and paste the exact same mathematical formula or helper logic into every single class that implements that interface.

**The "Wrong" Way (What to avoid):**
Copy-pasting `getDamageMultiplier` logic into `Hero`, `WoodenPawn`, and `FireElemental`. Alternatively, forcing `WoodenPawn` to extend a `LivingCreature` base class just so it can inherit the math.

**How it is applied here:**
- `extension DamageMath on Damageable`. 
- We attached the resistance multiplier math to the interface itself. The `WoodenPawn` just provides the map, and the extension handles the calculation automatically without cluttering the crate's code.

**When it is WRONG to use this:**
When the logic directly manipulates private state in unpredictable ways, or when the implementation needs to be highly customized per class. Extensions are for universal, side-effect-free helpers.