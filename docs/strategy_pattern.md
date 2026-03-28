# Strategy Pattern

**Concept:** Define a family of algorithms, put each one in its own class, and make them interchangeable via an interface.

**When to use it:** When your app needs to do the same basic task (like dealing damage or applying a status) but the *rules* for how it happens vary wildly between different types.

**The "Wrong" Way (What to avoid):**
Putting a massive `switch(attackType)` or `if (effect == 'burn') { ... } else if (effect == 'poison') { ... }` block inside your core engine. Every time you invent a new spell, you have to break open your engine code and edit that switch statement.

**How it is applied here:**
- The `Attack` interface (`FireAttack`, `PhysicalAttack`) and the `StatusEffect` interface (`BurnEffect`). 
- The `CombatEngine` doesn't know what a Fireball or a Burn is. It just calls `attack.calculateBaseDamage()` or `effect.onTurnEnd()` and trusts the specific strategy class to handle its own custom math.

**When it is WRONG to use this:**
Do not use Strategy if there is only one way to do a task, and it is unlikely to ever change. Creating a single-use interface for something trivial is over-engineering.