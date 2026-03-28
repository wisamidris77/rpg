# Factory Method Pattern

**Concept:** A creational pattern that provides an interface for creating objects, but allows subclasses or specific methods to alter the type of objects that will be created.

**How it is applied here:**
Instead of hardcoding our player and enemies in `main.dart`, I built a `LevelFactory`. 
- The UI simply asks the factory: `LevelFactory.buildLevel(1)`.
- The factory handles the messy logic of deciding that Level 1 has a `WoodenCrate` and Level 2 has a `FireElemental`. It bundles them into a `CombatEngine` and returns the ready-to-play engine.
- This keeps the UI and the App Entrypoint 100% ignorant of the game state logic.