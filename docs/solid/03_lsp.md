# Liskov Substitution Principle (LSP)

**Concept:** Objects of a superclass should be replaceable with objects of its subclasses without breaking the application.

**How it is applied here:**
I updated the `CombatEngine` so it no longer targets a `Hero`. It now targets a `Damageable` interface. 
- I created a `Hero`, a `Goblin`, and a `WoodenCrate`. All of them implement `Damageable`.
- I can pass ANY of these into the `CombatEngine`. The engine doesn't care what it is hitting; it trusts that every `Damageable` object knows how to correctly adjust its own health without crashing the game.