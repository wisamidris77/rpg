# Data-Driven Design

**Concept:** Define behaviors and variations using pure data (like Maps, JSON, or configs) rather than hardcoded logic. The core engine just reads the numbers.

**When to use it:**
When you have dozens or hundreds of variations of an object (like enemies, items, or weapons) that fundamentally do the same thing but have different stats.

**The "Wrong" Way (What to avoid):**
Writing hardcoded rules for specific entities into the engine code. E.g., `if (target.name == 'Lava Golem' && attack.element == Element.fire) return 0;`

**How it is applied here:**
- The `Map<Element, double> resistances`. 
- We didn't write logic for fire immunity. We just gave the `FireElemental` a data point: `Element.fire: 0.0`. The engine blindly multiplies the incoming damage by `0.0`. The data dictates the outcome, not the logic.

**When it is WRONG to use this:**
When a variation requires a fundamental change in *behavior*, not just a tweak to the numbers. If hitting the Lava Golem with fire doesn't just deal 0 damage, but actually triggers a custom animation, splits the golem into two smaller golems, and heals them, simple data multipliers aren't enough—you need to write custom logic (likely a Strategy).