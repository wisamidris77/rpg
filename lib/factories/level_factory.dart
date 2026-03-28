import '../engine/combat_engine.dart';
import '../models/entities/player.dart';
import '../models/entities/wooden_pawn.dart';
import '../models/entities/lava_golem.dart';

class LevelFactory {
  // A static factory method. You give it a level number, it gives you a fully prepped engine.
  static CombatEngine buildLevel(int levelNumber) {
    // 1. Create the persistent player
    final player = Player(name: 'Knight', health: 150, maxHealth: 150);

    // 2. Generate enemies based on the level
    final enemies = [];
    if (levelNumber == 1) {
      enemies.add(WoodenPawn());
    } else if (levelNumber == 2) {
      enemies.add(WoodenPawn());
      enemies.add(LavaGolem());
    } else {
      // Endless mode or boss fallback
      enemies.add(LavaGolem());
      enemies.add(LavaGolem());
    }

    // 3. Assemble and return the engine
    return CombatEngine(player: player, enemies: enemies);
  }
}