# Entity Hierarchy

**Concept:** Segregating game objects into strict behavioral contracts.

**How it is applied here:**
- `Entity`: The absolute root. Everything in the game world has an ID and a Name.
- `Damageable`: An interface for anything that has Health (Players, Enemies, Crates).
- `Enemy`: An interface for things you fight. They provide `xpReward`.
- `Playable`: An interface for the user's character. They have `level`, `experience`, and `gainXp()`.

By keeping these separated, a `WoodenCrate` can be `Damageable` without being an `Enemy` (it doesn't give XP), and a `Player` doesn't accidentally inherit enemy AI methods.