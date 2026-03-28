import 'package:rpg/engine/i_combat_engine.dart';
import 'package:rpg/models/attacks/attack.dart';
import 'package:rpg/models/entities/damageable.dart';


class CombatEngine implements ICombatEngine {
  @override
  void executeAttack(Damageable target, Attack attack) {
    if (target.isDead) return;

    int finalDamage = attack.calculateDamage(target);
    
    target.health -= finalDamage;
    if (target.health < 0) target.health = 0;

    print('${attack.name} hit ${target.name} for $finalDamage damage!');
  }
}