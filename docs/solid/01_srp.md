# Single Responsibility Principle (SRP)

**Concept:** A class should have one, and only one, reason to change.

**How it is applied in this project:**
Instead of putting all the game logic and data inside the UI widget, I split it into three separate layers in the `lib` folder:
1. `lib/models/hero.dart`: Only handles the data structure of a character. 
2. `lib/engine/combat_engine.dart`: Only handles the math and rules of fighting.
3. `lib/screens/battle_screen.dart`: Only handles painting the UI and routing button presses to the engine.