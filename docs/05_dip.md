# Dependency Inversion Principle (DIP)

**Concept:** High-level modules should not depend on low-level modules. Both should depend on abstractions. Dependencies should be injected rather than hardcoded.

**How it is applied here:**
- I created an `ICombatEngine` interface.
- `BattleScreen` no longer creates `CombatEngine()` directly. Instead, it requires an `ICombatEngine` to be passed into its constructor (Dependency Injection).
- This means I can easily swap out the standard `CombatEngine` for a `NetworkedCombatEngine` or a `TestingCombatEngine` in the future without ever touching the UI code.