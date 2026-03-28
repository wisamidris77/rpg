# Open/Closed Principle (OCP)

**Concept:** Software entities (classes, modules, functions) should be open for extension, but closed for modification.

**How it is applied here:**
Instead of passing raw integers to the `CombatEngine`, we pass an `Attack` interface. 
- **Open for Extension:** We can create `FireAttack`, `PhysicalAttack`, or `PoisonAttack` by creating new files that implement the `Attack` interface.
- **Closed for Modification:** The `CombatEngine` never needs to be updated when we add a new attack type. It just calls `attack.calculateDamage(target)` and trusts the attack object to do the math.