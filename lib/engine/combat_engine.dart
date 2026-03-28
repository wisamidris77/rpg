import 'package:rpg/models/attacks/attack.dart';
import 'package:rpg/models/entities/damageable.dart';

import '../models/entities/player.dart';

class CombatEngine {
  void executeAttack(Damageable target, Attack attack) {
    int finalDamage = attack.calculateDamage(target);
    target.health -= finalDamage;
    if (target.health < 0) target.health = 0;
  }
}
