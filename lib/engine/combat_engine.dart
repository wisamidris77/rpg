import '../models/player.dart';

class CombatEngine {
  void takeDamage(Player target, int damage) {
    target.health -= damage;
    if (target.health < 0) target.health = 0;
  }
}