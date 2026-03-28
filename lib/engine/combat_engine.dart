import 'package:rpg/models/attacks/attack.dart';

import '../models/player.dart';

class CombatEngine {
  void executeAttack(Player target, Attack attack) {
    int finalDamage = attack.calculateDamage(target);
    target.health -= finalDamage;
    if (target.health < 0) target.health = 0;
  }
}
